open Core_kernel
open Bap.Std
open Graphlib.Std

module G = Graphlib.Make(Tid)(Unit)

module Dest : (sig
           val inter_proc : blk term -> tid list
           val intra_proc : blk term -> tid list
           val is_noreturn : blk term -> bool
         end) = struct

  type call = [
    | `Goto of tid
    | `Return_to of tid
    | `Call of tid
    ]

  let return_of_call c =
    match Call.return c with
    | Some Direct t -> Some (`Return_to t)
    | _ -> None

  let target_of_call c =
    match Call.target c with
    | Direct t -> Some (`Call t)
    | _ -> None

  let dests_of_call c =
    List.filter_map ~f:ident [target_of_call c; return_of_call c]

  let dests_of_blk b =
    Seq.fold (Blk.elts b) ~init:[] ~f:(fun acc -> function
        | `Def _ | `Phi _ -> acc
        | `Jmp j ->
           match Jmp.kind j with
           | Int _ | Ret _ | Goto (Indirect _) -> acc
           | Goto (Direct t) -> `Goto t :: acc
           | Call c -> dests_of_call c @ acc)

  let has_call b =
    List.exists (dests_of_blk b) ~f:(function
        | `Call _ -> true
        | _ -> false)

  let has_return b =
    List.exists (dests_of_blk b) ~f:(function
        | `Return_to _ -> true
        | _ -> false)

  let is_noreturn b = has_call b && not (has_return b)

  let intra_proc b =
    List.filter_map (dests_of_blk b) ~f:(function
        | `Goto t | `Return_to t -> Some t
        | _ -> None)

  let inter_proc b =
    List.filter_map (dests_of_blk b) ~f:(function
        | `Call t -> Some t
        | _ -> None)

end

type graph = {
    entry  : tid;
    exit_  : tid;
    itself : G.t;
  }

type subroutine = {
    term   : sub term;
    graph  : graph option;
    calls  : tid list Tid.Map.t  (* caller -> callees *)
  }


let print x = true

(* returns a list of all nodes that were removed and a new graph as well  *)
let remove_unreachable g roots =
  let good_to_remove g x =
    not @@ Graphlib.is_reachable (module G) g.itself g.entry x in
  let remove g n =
    {g with itself = G.Node.remove n g.itself} in
  List.fold roots ~init:(g,[])
    ~f:(fun (g,rm) root ->
      let g, rm = Graphlib.fold_reachable (module G) ~init:(g,rm) g.itself root
        ~f:(fun (g',rm) x ->
          if good_to_remove g x then remove g' x, x :: rm
          else g',rm) in
      remove g root, root :: rm)

(* returns a new graph and a list of unreachable nodes
   that appeared due to remove.
   It doesn't remove edge to the exit node  *)
let remove_output_edges g tid =
  let is_unreachable g node =
    G.Node.degree ~dir:`In node g.itself = 0 && (node <> g.entry) in
  let outs = G.Node.outputs tid g.itself in
  let outs = Seq.filter outs ~f:(fun e -> Tid.(G.Edge.dst e <> g.exit_)) in

  Seq.fold ~init:(g,[]) outs ~f:(fun (g,tids) e ->
      let g = {g with itself = G.Edge.remove e g.itself} in
      let dst = G.Edge.dst e in
      if is_unreachable g dst then
        g, dst :: tids
      else g, tids)

let edge_to_exit g n =
  { g with itself =
    G.Edge.(insert (create n g.exit_ ()) g.itself) }



let print_graph g =
  printf "edges:\n";
  Seq.iter (G.edges g.itself) ~f:(fun e ->
      printf "%a --> %a\n" Tid.ppo (G.Edge.src e) Tid.ppo
        (G.Edge.dst e));
  printf "exit: %a\n" Tid.ppo g.exit_


let update no_rets sub =
  match sub.graph with
  | None -> sub
  | Some g ->
     let roots,g =
       Map.fold sub.calls ~init:([],g)
         ~f:(fun ~key:caller ~data:callees init ->
           List.fold callees ~init ~f:(fun (unreachable,g) callee ->
               if Set.mem no_rets callee then
                 let g,unreachable' = remove_output_edges g caller in
                 let g = edge_to_exit g caller in
                 unreachable @ unreachable', g
               else unreachable, g)) in
     let graph, unreachable = remove_unreachable g roots  in

     if print sub.term then
       begin
         printf "updated graph:\n";
         print_graph graph;
       end;

     let term = List.fold unreachable ~init:sub.term ~f:(Term.remove blk_t) in
     {sub with graph = Some graph; term}



let of_sub s =
  let blks = Term.to_sequence blk_t s in
  match Seq.hd blks with
  | None -> {term=s; graph=None; calls = Map.empty (module Tid) }
  | Some hd ->
     let blks,calls =
       Seq.fold blks ~init:(Map.empty (module Tid),Map.empty (module Tid))
         ~f:(fun (blks,calls) b ->
           let blks = Map.set blks (Term.tid b) b in
           let callees = Dest.inter_proc b in
           blks, Map.set calls (Term.tid b) callees) in
     let rec loop g node =
       let g = G.Node.insert node g in
       let b = Map.find_exn blks node in
       let dsts = Dest.intra_proc b in

       if print s then
         printf " node %a dsts: %s\n" Tid.ppo node
           (List.map ~f:Tid.to_string dsts |> String.concat ~sep:" ");


       let dsts' = List.filter ~f:(fun n -> not (G.Node.mem n g)) dsts in
       let g = List.fold dsts ~init:g ~f:(fun g tid ->
                   G.Edge.(insert (create node tid ()) g)) in
       match dsts' with
       | [] -> g
       | dsts' -> List.fold dsts' ~init:g ~f:loop in
     let g = loop G.empty (Term.tid hd) in
     let entry = Term.tid hd in
     let exit_ = Tid.create () in
     let g = G.nodes g |>
       Seq.fold ~init:g ~f:(fun g b ->
           if Dest.is_noreturn (Map.find_exn blks b) then
             G.Edge.(insert (create b exit_ ()) g)
           else g) in
     let graph = {entry;exit_;itself=g} in

     if print s then print_graph graph;

     if print s then
       begin
         printf "calls\n";
         Map.iteri calls ~f:(fun ~key:caller ~data:callees ->
             printf " %a calls for %s\n" Tid.ppo caller
               (List.map callees ~f:Tid.to_string
                |> String.concat ~sep:" "));
       end;

     {term = s; graph = Some graph; calls}


let map no_returns sub =
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
    end)#map_sub sub

let of_prog prog =
  Term.to_sequence sub_t prog |>
    Seq.fold ~init:([],Set.empty (module Tid))
      ~f:(fun (subs,no_rets) s ->
        let no_rets =
          match Term.get_attr s Sub.noreturn with
          | None -> no_rets
          | Some _ -> Set.add no_rets (Term.tid s) in
        of_sub s :: subs, no_rets)


(* a subroutine is considered as a non-return one
   if there is a call with-no-return that post-dominates
   all the other blocks in a graph *)
let is_no_return no_rets sub =
  match sub.graph with
  | None -> false
  | Some g ->

     let doms = Graphlib.dominators (module G) ~rev:true g.itself g.exit_ in

     let () = if print sub.term then
                begin
                  Format.printf "%a\n%!" (Tree.pp Tid.pp) doms;
                end in

     let no_returns =
       Map.fold sub.calls ~init:[] ~f:(fun ~key:caller ~data:callees acc ->
           match callees with
           | [] -> acc
           | callees ->
           if List.for_all callees ~f:(Set.mem no_rets)
           then caller :: acc
           else acc) in

     if print sub.term then
       begin
         List.iter no_returns ~f:(fun t -> printf " no ret: %a\n" Tid.ppo t);
         Map.iteri sub.calls ~f:(fun ~key:caller ~data:callees ->
             printf "caller %a, callles: %s\n" Tid.ppo caller
               (List.fold callees ~init:""
                  ~f:(fun s c -> sprintf "%s(%s %b) " s (Tid.to_string c)
                                (Set.mem no_rets c))));




       end;

     let nodes = G.nodes g.itself
                 |> Seq.filter ~f:(fun n -> Tid.(n <> g.exit_)) in

     List.exists no_returns ~f:(fun b ->
         let r =
         Seq.for_all nodes  ~f:(fun no_ret ->

               Tid.(b = no_ret) ||
                 Tree.is_descendant_of doms ~parent:b no_ret
           ) in
         if r && print sub.term then
           printf "no return because of %a\n" Tid.ppo b;
         r
       )


let run prog =
  let run_prog subs no_rets =
    List.fold subs ~init:([],no_rets) ~f:(fun (subs, no_rets) s ->
        if Set.mem no_rets (Term.tid s.term) then s :: subs, no_rets
        else
          let s = update no_rets s in
          if is_no_return no_rets s then
            let () = printf "no return %s\n%!" (Sub.name s.term) in
            s :: subs, Set.add no_rets (Term.tid s.term)
          else s :: subs,no_rets) in
  let rec loop subs no_rets =
    let subs,no_rets' = run_prog subs no_rets in
    if Set.is_empty (Set.diff no_rets' no_rets) then subs,no_rets
    else loop subs no_rets' in
  let subs,no_rets = of_prog prog in
  let subs,no_rets = loop subs no_rets in
  let bld = Program.Builder.create () in
  List.iter subs ~f:(fun s ->
      let s = map no_rets s.term in
      Program.Builder.add_sub bld s);
  Program.Builder.result bld


let main p =
  Project.with_program p (run (Project.program p))

let () = Project.register_pass ~deps:["abi"] main
