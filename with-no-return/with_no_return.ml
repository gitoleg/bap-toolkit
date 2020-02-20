
open Core_kernel
open Bap.Std
open Graphlib.Std

include Self ()

module G = Graphs.Tid

type graph = {
  no_ret : tid;
  itself : G.t;
}

type dest =
  | Intra of tid option
  | Inter of label * label option

type subroutine = {
  tid   : tid;
  graph : graph;
  dests : dest list Tid.Map.t;
}

(** [make_no_return g blk] removes edge to a
    non-return function with tid [callee] and connect
    blk with an synthetic no-ret node *)
let make_no_return g blk =
  let itself =
    Seq.fold (G.Node.outputs blk g.itself)
      ~init:g.itself
      ~f:(fun g e -> G.Edge.remove e g) in
  let itself = G.Edge.(insert (create blk g.no_ret g.no_ret) itself) in
  { g with itself }

(** [update norets sub] updates sub's graph, so
    any edge to function in [norets] will be replaced
    with an edge to synthetic no-return node *)
let update no_rets sub =
  let graph = Map.fold sub.dests ~init:sub.graph
      ~f:(fun ~key:blk ~data:dests g ->
          match dests with
          | Inter (Direct x,_) :: _ when Set.mem no_rets x ->
            make_no_return g blk
          | _ -> g) in
  {sub with graph}

let dest_of_jmp j =
  match Jmp.kind j with
  | Int (_,x) | Goto Direct x | Ret Direct x -> Intra (Some x)
  | Ret _ | Goto _ -> Intra None
  | Call c -> Inter (Call.target c, Call.return c)

let dests_of_block b =
  Term.to_sequence jmp_t b |>
  Seq.fold ~init:[] ~f:(fun acc j -> dest_of_jmp j :: acc) |>
  List.rev

let collect_destinations sub =
  Term.to_sequence blk_t sub |>
  Seq.fold ~init:(Map.empty (module Tid))
    ~f:(fun dests b ->
        Map.set dests (Term.tid b) (dests_of_block b))

let of_sub s =
  let dests = collect_destinations s in
  let no_ret = Tid.create () in
  let graph =
    G.Edge.(insert (create no_ret G.exit no_ret) (Sub.to_graph s)) in
  let graph = {itself=graph; no_ret} in
  {tid = Term.tid s; graph; dests;}

let map no_returns prog =
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

let is_known_noreturn s g =
  Term.has_attr s Sub.noreturn ||
  G.Node.has_edge G.start G.exit g

let of_prog prog =
  Term.to_sequence sub_t prog |>
  Seq.fold ~init:([],Set.empty (module Tid))
    ~f:(fun (subs,no_rets) s ->
        let s' = of_sub s in
        let no_rets =
          if is_known_noreturn s s'.graph.itself then
            Set.add no_rets (Term.tid s)
          else no_rets in
        s' :: subs, no_rets)

(** [is_no_return sub] returns true if the no-ret node
    postdominate sub's entry node. *)
let is_no_return sub =
  let g = sub.graph in
  let doms = Graphlib.dominators (module G) ~rev:true g.itself G.exit in
  Tree.is_descendant_of doms ~parent:g.no_ret G.start

let run prog =
  let run_prog subs no_rets =
    List.fold subs ~init:([],no_rets) ~f:(fun (subs, no_rets) s ->
        if Set.mem no_rets s.tid then s :: subs, no_rets
        else
          let s = update no_rets s in
          if is_no_return s then
            s :: subs, Set.add no_rets s.tid
          else s :: subs,no_rets) in
  let rec loop subs no_rets =
    let subs,no_rets' = run_prog subs no_rets in
    if Set.is_empty (Set.diff no_rets' no_rets) then no_rets
    else loop subs no_rets' in
  let subs,no_rets = of_prog prog in
  let no_rets = loop subs no_rets in
  map no_rets prog

let main p =
  Project.with_program p (run (Project.program p))

let () =
  Config.when_ready (fun _ -> Project.register_pass ~deps:["api"] main)
