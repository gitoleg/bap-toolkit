
open Core_kernel
open Bap.Std
open Graphlib.Std

include Self ()

module G = Graphs.Tid

type call_edge = tid * tid  (* Blk tid and jmp tid *)

type subroutine = {
  tid   : tid;
  graph : G.t;
  indirect : tid;
  calls : call_edge list Tid.Map.t;
}

let is_resolved j =
  List.filter_map ~f:ident [Jmp.dst j; Jmp.alt j] |>
  List.exists ~f:(fun d -> Either.is_first (Jmp.resolve d))

let is_indirect j = not (is_resolved j)

let indirects_of_blk b =
  Term.to_sequence jmp_t b |> Seq.filter ~f:is_indirect

let connect_indirects g indirect blk =
  Seq.fold (indirects_of_blk blk) ~init:g
    ~f:(fun g j ->
        let e = G.Edge.create (Term.tid blk) indirect (Term.tid j) in
        G.Edge.insert e g)

let calls_of_blk calls b =
  Term.to_sequence jmp_t b |>
  Seq.fold ~init:calls ~f:(fun acc j ->
      match Jmp.alt j with
      | None -> acc
      | Some dst -> match Jmp.resolve dst with
        | First tid ->
          Map.add_multi acc tid (Term.tid b, Term.tid j)
        | _ -> acc)

let calls_of_sub sub =
  Term.to_sequence blk_t sub |>
  Seq.fold ~init:(Map.empty (module Tid)) ~f:calls_of_blk

let of_sub sub =
  let indirect = Tid.create () in
  let graph = Sub.to_graph sub in
  let graph =
    Seq.fold (Term.to_sequence blk_t sub) ~init:graph
      ~f:(fun g b -> connect_indirects g indirect b) in
  let calls = calls_of_sub sub in
  {tid = Term.tid sub; graph; indirect; calls}

let update s tid =
  match Map.find s.calls tid with
  | None -> s
  | Some edges ->
    let graph = List.fold edges ~init:g
        ~f:(fun g (blk,lbl) ->
            let g, maybe_unreachable =
              G.Node.outputs blk g |>
              Seq.fold ~init:(g, []) ~f:(fun (g, unr) e ->
                  if Tid.equal (G.Edge.label e) lbl then
                    G.Edge.remove e g, G.Edge.dst e :: unr
                  else g, unr) in
            List.fold ~init:g maybe_unreachable ~f:(fun g blk ->
                if G.Node.degree ~dir:`Out blk g = 0 then
                  G.Edge.(insert (create s.indirect blk s.indirect) g)
                else g)) in
    { s with graph }


let update norets s =
  if Set.inter s.calls norets = Set.empty
  then s
  else
    Map.fold s.dests ~init:s.g ~f:(fun ~key:bid ~data:dests g ->




        let make_no_return sub



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

       let dest_of_jmp j = match Jmp.kind j with
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
