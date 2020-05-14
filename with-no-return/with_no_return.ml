
let doc = {|
   This pass removes fall-trough edge from all the calls to the non-return
   functions.

   Algorithm

   The algorithm DOESN'T make any conclusions based on the IR terms
   themselfs. The naive approach would be to collect
   all the calls from the given subroutine and once all of them are
   non-return (each call doesn't have return destination) then the
   whole subroutine is non-return also. This approach won't work,
   since there could be tail calls. And even if they are absent in the
   real program, we still have byteweight that can add a root in the
   middle of a subroutine, which will look like a tail call. And a
   tail call doesn't mean that a subroutine doesn't return, it still
   can return from the callee to the subroutine's caller.

   Instead, the algorithm works with the Tid graph of a subroutine,
   which has artificial start and exit node. And the invariant is that
   exit node is reachable from start in the original graph. Moreover,
   we harden the original graph of the subroutine.

   First, we add one more artificial node (we named it 'indirect') and
   connect all the blocks with indirect jumps with this new created
   node. Once we introduce unreachable block in a subroutine (and we
   will), we  connect the indirect node with this unreachable block.
   By doing so, we're taking in account that any block can be reached
   via indirect jump, hence the exit too.

   Second, given that any IR 'call with noreturn' leads out of the
   subroutine, meaning that we need to connect the block with such
   call with exit, with the only exception for known nonreturn
   functions.

   We start from the initial set of the non-return functions, such ones
   that either have GNU noreturn attribute OR have an edge between
   start and exit nodes in the Tid graph. For instance, the latter can
   happen when a loop without exit exists in a graph of a subroutine.

   For a given subroutine, if there is a call to any of these
   functions we remove a corresponded fall-through edge in the Tid
   graph. Now, if the exit node is unreachable from the start, the
   subroutine is also the non-return one, and we can add it to the set
   of the non-return functions.

   The implementation. We use the fix-point algorithm to reduce the
   complexity cost. We connect all the roots (i.e. subroutines with
   no input edges) with an artificial entry node in the program
   call graph. And then, for the reversed graph, we propagate
   this non-return property from leaves (known non-return functions)
   as far it's possible. The trasnfer function is basically the
   algorithm described above. Finally, we need a solution only for one
   node - for the entry node.
|}

open Core_kernel
open Bap.Std
open Bap_main
open Graphlib.Std

let subs = Term.to_sequence sub_t
let blks = Term.to_sequence blk_t
let jmps = Term.to_sequence jmp_t

module Tids = struct
  module G = Graphs.Tid
  let indirect = Tid.create ()

  let is_resolved j =
    List.filter_map ~f:ident [Jmp.dst j; Jmp.alt j] |>
    List.exists ~f:(fun d -> Either.is_first (Jmp.resolve d))

  let is_indirect j = not (is_resolved j)

  let connect_indirects g blk =
    Seq.fold (jmps blk) ~init:g
      ~f:(fun g j ->
          if is_indirect j then
            let e = G.Edge.create
                (Term.tid blk) indirect (Term.tid j) in
            G.Edge.insert e g
          else g)

  let is_call_with_noreturn j =
    match Jmp.kind j with
    | Call c -> Option.is_none (Call.return c)
    | _ -> false

  let calls_with_noreturn blk =
    Seq.fold (jmps blk) ~init:[] ~f:(fun acc jmp ->
        match Jmp.alt jmp with
        | None -> acc
        | Some dst -> match Jmp.resolve dst with
          | First tid when is_call_with_noreturn jmp ->
            tid :: acc
          | _ -> acc)

  let connect_with_exit g n =
    G.Edge.insert (G.Edge.create n G.exit G.exit) g

  let has_tail_call known blk =
    List.exists (calls_with_noreturn blk)
      ~f:(fun c -> not (Set.mem known c))

  let of_sub known_no_rets sub =
    let noreturns_as_exit g blk =
      if has_tail_call known_no_rets blk then
        connect_with_exit g (Term.tid blk)
      else g in
    Seq.fold (blks sub) ~init:(Sub.to_graph sub)
      ~f:(fun g blk ->
          let g = noreturns_as_exit g blk in
          connect_indirects g blk)

  include G
end

module Callgraph = struct
  include Graphs.Callgraph
  let entry = Tid.create ()
end


type callsite = {
  blk : tid;
  jmp : tid;
}

type subroutine = {
  tid   : tid;
  graph : Tids.t;
  callees : callsite list Tid.Map.t;
}

let callees_of_blk callees b =
  Seq.fold (jmps b) ~init:callees ~f:(fun acc j ->
      match Jmp.alt j with
      | None -> acc
      | Some callee -> match Jmp.resolve callee with
        | First callee ->
          Map.add_multi acc callee
            { blk = Term.tid b; jmp = Term.tid j; }
        | _ -> acc)

let callees_of_sub sub =
  Seq.fold (blks sub)
    ~init:(Map.empty (module Tid)) ~f:callees_of_blk

let of_sub known sub =
  if Seq.is_empty (blks sub)
  then None
  else
    Some {
      tid = Term.tid sub;
      graph = Tids.of_sub known sub;
      callees = callees_of_sub sub
    }

(** [prune_fallthrough_edge g callsite] removes fall-through edge
    from [callsite] in graph [g].
    Sub's tids graph has edges whose labels
    are tids of a corresponded jumps in the source block.
    Thus, labels for return-from-call edges have the same tid
    as calls, we need just to find them *)
let prune_fallthrough_edge g callsite =
  Tids.Node.outputs callsite.blk g |>
  Seq.fold ~init:g ~f:(fun g e ->
      if Tid.equal (Tids.Edge.label e) callsite.jmp
      then Tids.Edge.remove e g
      else g)

let is_unreachable b g = Tids.Node.degree ~dir:`Out b g = 0

let make_reachable_indirectly g blk =
  if is_unreachable blk g then
    Tids.Edge.(insert (create Tids.indirect blk Tids.indirect) g)
  else g

let prune_fallthrough_edges callsites g =
  List.fold callsites ~init:g
    ~f:(fun g call ->
        let dsts =
          Tids.Node.outputs call.blk g |>
          Seq.map ~f:Tids.Edge.dst in
        let g = prune_fallthrough_edge g call in
        Seq.fold dsts ~init:g
          ~f:make_reachable_indirectly)

let update s no_ret =
  match Map.find s.callees no_ret with
  | None -> s
  | Some calls ->
    {s with graph = prune_fallthrough_edges calls s.graph }

let is_no_return s =
  not (Graphlib.is_reachable (module Tids) s.graph Tids.start Tids.exit)

let has_infinite_loop s =
  Tids.Node.has_edge Tids.start Tids.exit s.graph

let transfer subs tid no_rets =
  if Set.mem no_rets tid then no_rets
  else
    match Map.find subs tid with
    | None -> no_rets
    | Some s ->
      if has_infinite_loop s
      then Set.add no_rets s.tid
      else
        let s = Set.fold no_rets ~init:s ~f:update in
        if is_no_return s
        then Set.add no_rets s.tid
        else no_rets

let has_no_inputs calls s =
  Callgraph.Node.degree ~dir:`In (Term.tid s) calls = 0

let connect_with_entry calls entry s =
  if has_no_inputs calls s then
    Callgraph.Edge.insert
      (Callgraph.Edge.create entry (Term.tid s) []) calls
  else calls

let graphs known_norets p =
  let subs = Map.empty (module Tid) in
  let callgraph = Program.to_graph p in
  let callgraph, subs =
    Term.to_sequence sub_t p |>
    Seq.fold ~init:(callgraph, subs) ~f:(fun (calls, subs) s ->
        let subs = match of_sub known_norets s with
          | None -> subs
          | Some s' -> Map.add_exn subs (Term.tid s) s' in
        let calls = connect_with_entry calls Callgraph.entry s in
        calls, subs) in
  callgraph,subs

let apply no_returns prog =
  (object
    inherit Term.mapper

    method! map_jmp j =
      match Jmp.kind j with
      | Goto _ | Ret _ | Int _ -> j
      | Call c ->
        match Call.target c with
        | Indirect _ -> j
        | Direct tid ->
          if Set.mem no_returns tid then
            Jmp.with_kind j (Call (Call.with_noreturn c))
          else j
  end)#run prog

let known_noreturns prog =
  Seq.fold (subs prog) ~init:(Set.empty (module Tid))
    ~f:(fun tids s ->
        if Term.has_attr s Sub.noreturn then
          Set.add tids (Term.tid s)
        else tids)

let run prog =
  let known = known_noreturns prog in
  let calls,subs = graphs known prog in
  let initial =
    Solution.create (Map.empty (module Tid)) known in
  let sol =
    Graphlib.fixpoint (module Graphs.Callgraph) calls
      ~rev:true
      ~init:initial
      ~equal:Tid.Set.equal
      ~merge:Set.union
      ~f:(transfer subs) in
  apply (Solution.get sol Callgraph.entry) prog

let main p =
  Project.with_program p (run (Project.program p))

let () =
  Extension.documentation doc;
  Extension.declare @@ fun _ctxt ->
  Project.register_pass ~deps:["api"] main;
  Ok ()
