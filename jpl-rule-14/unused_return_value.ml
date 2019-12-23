open Core_kernel
open Bap.Std
open Bap_primus.Std
open Bap_taint.Std

open Monads.Std

include Self ()

module Machine_id = Monads.Std.Monad.State.Multi.Id
module Machines = Machine_id.Map
module Values = Primus.Value.Set
module Vids = Primus.Value.Id.Set
module Vid = Primus.Value.Id

type value = Primus.value
type machine = Primus.Machine.id
type func = string * addr
type proof = Used | Unused

type state = {
  functions  : func Primus.Value.Id.Map.t;
  proved     : proof Addr.Map.t;
}

let state = Primus.Machine.State.declare
    ~name:"unused-results"
    ~uuid:"af66d451-fb62-44c3-9c2a-8969e111ad91"
    (fun _ -> {
         functions  = Map.empty (module Primus.Value.Id);
         proved     = Map.empty (module Addr); })

let _, unused =
  Primus.Observation.provide ~inspect:sexp_of_string "unused"

let notify name addr = function
  | Used -> ()
  | Unused ->
    printf "unused result of %s at %a\n%!" name Addr.ppo addr

module Results(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  module Object = Taint.Object.Make(Machine)
  module Tracker = Taints_tracker.Tracker(Machine)
  open Machine.Syntax

  let create taint name addr =
    Tracker.on_new_taint taint >>= fun  () ->
    let addr = Value.to_word addr in
    let vid = Value.id taint in
    Value.Symbol.of_value name >>= fun name ->
    Machine.current () >>= fun cur ->
    Machine.Global.update state ~f:(fun s ->
        { s with
          functions = Map.set s.functions vid (name,addr)}) >>= fun () ->
    Value.b1

  let mark taint usage =
    let vid = Value.id taint in
    Machine.Global.get state >>= fun s ->
    match Map.find s.functions vid with
    | None -> Value.b0
    | Some (name,addr) ->
      notify name addr usage;
      let s = {s with proved = Map.set s.proved addr usage} in
      Machine.Global.put state s >>= fun () ->
      Value.b1

  let mark_used taint = mark taint Used
  let mark_unused taint = mark taint Unused

  let is_known_usage taint =
    let vid = Value.id taint in
    Machine.Global.get state >>= fun s ->
    match Map.find s.functions vid with
    | None -> Value.b0
    | Some (name,addr) ->
      Value.of_bool (Map.mem s.proved addr)

end

module IsKnownUsage(Machine : Primus.Machine.S) = struct
  module Results = Results(Machine)

  [@@@warning "-P"]
  let run [v] = Results.is_known_usage v
end

module MaybeUnused(Machine : Primus.Machine.S) = struct
  module Results = Results(Machine)

  [@@@warning "-P"]
  let run [taint; name; addr] =
    Results.create taint name addr
end

module MarkUnused(Machine : Primus.Machine.S) = struct
  module Results = Results(Machine)

  [@@@warning "-P"]
  let run [v] = Results.mark_unused v
end

module MarkUsed(Machine : Primus.Machine.S) = struct
  module Results = Results(Machine)

  [@@@warning "-P"]
  let run [v] = Results.mark_used v
end


module HandleUnresolved(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  module Interpreter = Primus.Interpreter.Make(Machine)
  open Machine.Syntax

  let set_zero v =
    match Var.typ v with
    | Imm width ->
      Value.of_int ~width 0 >>= fun x ->
      Interpreter.set v x
    | _ -> Machine.return ()

  let on_unresolved _ =
    Machine.arch >>= function
    | `x86_64 -> set_zero X86_cpu.AMD64.rax
    | `x86 -> set_zero X86_cpu.IA32.rax
    |  _ -> Machine.return ()

  let init () =  Primus.Linker.unresolved >>> on_unresolved
end


type callsite = {
  calls : addr String.Map.t;
  undef : addr option;
}

let callsite = Primus.Machine.State.declare
    ~name:"unused-results-callsite"
    ~uuid:"1715922a-4e6d-4960-bbd4-a6fb8e239ddb"
    (fun _ -> { calls = Map.empty (module String); undef = None})


module Callsite (Machine : Primus.Machine.S) = struct
  module Value  = Primus.Value.Make(Machine)
  module Linker = Primus.Linker.Make(Machine)
  module Interp = Primus.Interpreter.Make(Machine)

  open Machine.Syntax

  let on_call (name,_) =
    Machine.Local.update callsite ~f:(fun s ->
        match s.undef with
        | None -> s
        | Some prev ->
          {calls = Map.set s.calls name prev; undef = None})

  let on_jump j =
    match Jmp.kind j with
    | Goto _ | Int _ | Ret _ -> Machine.return ()
    | Call c ->
      Interp.pc >>= fun pc ->
      match Call.target c with
      | Indirect _ ->
        Machine.Local.update callsite
          ~f:(fun s -> {s with undef = Some pc})
      | Direct tid ->
        Linker.resolve_symbol (`tid tid) >>= function
        | None -> Machine.return ()
        | Some name ->
          Machine.Local.update callsite
            ~f:(fun s ->
                {calls = Map.set s.calls name pc; undef = None})

  let init() =
    Machine.sequence [
      Primus.Interpreter.enter_jmp >>> on_jump;
      Primus.Linker.Trace.call >>> on_call;
    ]

end

module Callsite_addr(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  module Eval = Primus.Interpreter.Make(Machine)
  open Machine.Syntax

  [@@@warning "-P"]
  let run [sub] =
    Value.Symbol.of_value sub >>= fun name ->
    Machine.Local.get callsite >>= fun s ->
    match Map.find s.calls name with
    | Some addr -> Value.of_word addr
    | None -> Value.b0
end

let sub_args =
  Primus.Machine.State.declare
    ~name:"subroutines-arguments"
    ~uuid:"06f656ad-e922-4fa5-bc65-a3203b6819a2"
    (fun _ -> Map.empty (module String))

module Known_subs(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  open Machine.Syntax

  let init () =
    Machine.get () >>= fun proj ->
    let subs = Term.to_sequence sub_t (Project.program proj) in
    let m = Seq.fold subs
        ~init:(Map.empty (module String))
        ~f:(fun m sub ->
            match Term.to_sequence arg_t sub |> Seq.to_list with
            | [] -> m
            | args ->
              Map.set m (Sub.name sub) args) in
    Machine.Global.put sub_args m

end

module Return_arg(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  module Env = Primus.Env.Make(Machine)
  open Machine.Syntax

  let find sub =
    Value.Symbol.of_value sub >>= fun name ->
    Machine.Global.get sub_args >>= fun subs ->
    match Map.find subs name with
    | None -> Machine.return None
    | Some args ->
      Machine.return @@
      List.find args ~f:(fun a -> Arg.intent a = Some Out)

  [@@@warning "-P"]
  let run [sub] =
    find sub >>= function
    | None -> Value.b0
    | Some a -> Value.Symbol.to_value (Var.name (Arg.lhs a))
end

module Is_sym(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  module Linker = Primus.Linker.Make(Machine)
  open Machine.Syntax

  [@@@warning "-P"]
  let run [addr] =
    let addr = `addr (Value.to_word addr) in
    Linker.resolve_symbol addr >>= function
    | None -> Value.b0
    | Some name ->
      Machine.Global.get sub_args >>= fun subs ->
      Value.of_bool (Map.mem subs name)

end

module Interface(Machine : Primus.Machine.S) = struct
  module Lisp = Primus.Lisp.Make(Machine)
  open Primus.Lisp.Type.Spec

  let init () =
    Machine.sequence [

      Lisp.define "check-if-used" (module MaybeUnused)
        ~types:(tuple [a;b;c] @-> b)
        ~docs:{|(check-if-used T SUB ADDR) marks
                 the return argument of SUB called at ADDR and
                 tainted with T for checking|};

      Lisp.define "is-known-usage" (module IsKnownUsage)
        ~types:(tuple [a] @-> b)
        ~docs:"(is-known-usage T) returns true if a taint T
                 from a return value of a function never was
                 already marked either as a used or as unused";

      Lisp.define "mark-unused" (module MarkUnused)
        ~types:(tuple [a] @-> b)
        ~docs:"(mark-used T) mark a return value of
                 a function tainted by taint T as the unused one";

      Lisp.define "mark-used" (module MarkUsed)
        ~types:(tuple [a] @-> b)
        ~docs:"(mark-used T) mark a return value of
                 a function tainted by taint T as the used one";

      Lisp.define "return-arg" (module Return_arg)
        ~types:(tuple [a] @-> b)
        ~docs:
          ({|(return-arg SUB) returns the name of output argument of the
            subroutine SUB. Returns NIL if the subroutine SUB doesn't
            return anything or subroutine's api is unknown|});

      Lisp.define "callsite-addr" (module Callsite_addr)
        ~types:(tuple [a] @-> b)
        ~docs:
          ({|(callsite-addr SUB) returns the address of the
             callsite of the previous call if the previous call
            was to subroutine SUB. Returns NIL otherwise. |});

      Lisp.define "is-known-symbol" (module Is_sym)
        ~types:(tuple [a] @-> b)
        ~docs:
          {|(is-known-symbol ADDR) returns true if there is a
           subroutine at ADDR with a known API. |};

    ]
end

open Bap_main

let enabled =
  Extension.Configuration.flag
    ~doc:"Enables the analysis"
    "enable"

let verbose =
  Extension.Configuration.parameter
    ~as_flag:1
    ~doc:"Level of verbosity. Currently supported
           1 - prints a result message, if the check passed or not
           >1 - prints a detail messages, where the problems are"
    Extension.Type.("dump" %: int)
    "verbose"


let () =
  let open Extension.Syntax in
  Extension.declare
  @@ fun ctxt ->
  if ctxt --> enabled then
    begin
      Taints_tracker.init ();
      Primus.Machine.add_component (module Interface);
      Primus.Machine.add_component (module HandleUnresolved);
      Primus.Machine.add_component (module Callsite);
      Primus.Machine.add_component (module Known_subs);
    end;
  Ok ()
