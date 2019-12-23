open Core_kernel
open Bap.Std
open Bap_primus.Std

type untrusted = {
    skipped  : string option;
    ignored  : Primus.Value.Id.Set.t;
  }

let untrusted = Primus.Machine.State.declare
    ~uuid:"95595c06-c9e0-47fe-a4d3-ba2e1a1a3bf6"
    ~name:"untrusted-values"
    (fun _ -> {
         skipped    = None;
         ignored    = Set.empty (module Primus.Value.Id);
    })

module UntrustedValues(Machine : Primus.Machine.S) = struct
  module Env = Primus.Env.Make(Machine)
  module Value = Primus.Value.Make(Machine)

  open Machine.Syntax

  let abi_specific_return_arg =
    Machine.arch >>= fun a ->
    match a with
    | `x86_64 -> !! (Some X86_cpu.AMD64.rax)
    | `x86 -> !! (Some X86_cpu.IA32.rax)
    | _ -> !! None

  let drop_skipped _ =
    Machine.Local.update untrusted
      ~f:(fun s -> {s with skipped = None})

  let get_name tid =
    let name = Tid.name tid in
    match String.chop_prefix name ~prefix:"@" with
    | None -> name
    | Some x -> x

  let on_jump jmp =
    match Jmp.kind jmp with
    | Goto _ | Ret _ | Int _ -> Machine.return ()
    | Call c -> match Call.target c with
      | Indirect _ -> Machine.return ()
      | Direct tid ->
         Machine.Local.update untrusted
           ~f:(fun s -> {s with skipped = Some (get_name tid)})

  let update_ignored_values _ =
    abi_specific_return_arg >>= function
    | None -> Machine.return ()
    | Some arg ->
       Env.get arg >>= fun v ->
       Machine.Local.update untrusted ~f:(fun s ->
           {s with ignored = Set.add s.ignored (Value.id v)})

  let check_skipped (var, value) =
    Machine.Local.get untrusted >>= fun {skipped} ->
    match skipped with
    | None -> Machine.return ()
    | Some _ ->
       update_ignored_values () >>= fun () ->
       drop_skipped ()

  let init () = Machine.sequence Primus.Linker.[
      Trace.call >>> drop_skipped;
      unresolved >>> update_ignored_values;
      Primus.Interpreter.read >>> check_skipped;
      Primus.Interpreter.enter_jmp >>> on_jump;
    ]
end

module IsUntrustedReturn(Machine : Primus.Machine.S) = struct
  module Value = Primus.Value.Make(Machine)
  open Machine.Syntax

  [@@@warning "-P"]
  let run [v] =
    Machine.Local.get untrusted >>= fun t ->
    Value.of_bool (Set.mem t.ignored (Value.id v))
end

let init () = Primus.Machine.add_component (module UntrustedValues)
