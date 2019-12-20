open Core_kernel
open Bap.Std

type location_id = string
type incident_name = string [@@deriving bin_io, compare,sexp]

type event =
  | Incident_location of location_id * addr
  | Incident of incident_name * location_id list
  | Incident_static of incident_name * string

module Parse = struct

  let addr_of_string a =
    Addr.of_string @@ sprintf "0x%s:64u" a

  let point_of_sexp x = match x with
    | Sexp.List _ -> None
    | Sexp.Atom x ->
      match String.split ~on:':' x  with
      | [_; addr] -> Some (addr_of_string addr)
      | [addr] -> Some (addr_of_string addr)
      | _ -> None

  let last_addr xs =
    Option.value_map ~default:None ~f:point_of_sexp (List.hd xs)

  let locs_of_sexps xs =
    List.filter_map xs ~f:(function
        | Sexp.Atom s -> Some s
        | _ -> None)

  let of_sexp s =
    let open Sexp in
    match s with
    | List (Atom "incident-location" :: List [Atom id; List points] :: _)  ->
       Option.map (last_addr points) ~f:(fun p -> Incident_location (id, p))
    | List (Atom "incident" :: List (Atom name :: locs) :: _) ->
       Incident (name, locs_of_sexps locs) |> Option.some
    | List (Atom "incident-static" :: List (Atom name :: data) :: _)  ->
       Incident_static (name, Sexp.to_string (List data)) |> Option.some
    | _ -> None

  let of_sexp s =
    try of_sexp s
    with e -> None

  let sexp ch =
    try Some (Sexp.input_sexp ch)
    with _ -> None

  let rec of_in_channel ch =
    let rec read () =
      match sexp ch with
      | None -> None
      | Some s ->
        match of_sexp s with
        | None -> read ()
        | Some _ as r -> r in
    read ()

end


type info =
  | Locations of addr list
  | Static_data of string
[@@deriving bin_io, compare,sexp]

type incident = {
    name : string;
    info : info;
  }
[@@deriving bin_io, compare,sexp]

module Incident = struct
  module Set = Set.Make(struct
      type t = incident [@@deriving bin_io, compare,sexp]
    end)
end


type t = {
  hist  : addr String.Map.t;
  incs  : Incident.Set.t;
}

let incident_location s (id,addr) =
  {s with hist = Map.set s.hist ~key:id ~data:addr}

let incident s name locs =
  let locs = List.filter_map locs ~f:(Map.find s.hist) in
  {s with incs = Set.add s.incs {name; info=Locations locs}}

let incident_static s name data =
  {s with incs = Set.add s.incs {name; info=Static_data data}}

let event s = function
  | Incident_location (id,addr) -> incident_location s (id,addr)
  | Incident (name, locs) -> incident s name locs
  | Incident_static (name, data) -> incident_static s name data

let read ch =
  let rec loop s =
    match Parse.of_in_channel ch with
    | None -> s
    | Some ev -> event s ev |> loop in
  let s = loop { hist = Map.empty (module String);
                 incs=Incident.Set.empty; } in
  s.incs

let log name real ours =
  let tp = Set.inter real ours in
  let fp = Set.diff ours real in
  let fn = Set.diff real ours in
  let line =
    sprintf "%s failed: True-pos/False-pos/False-neg: %d/%d/%d"
      name (Set.length tp) (Set.length fp) (Set.length fn) in
  Out_channel.with_file "toolkit.log" ~append:true ~f:(fun ch ->
      Out_channel.output_lines ch [line])

let print_status name status =
  let margin = 60 in
  let dots = String.init (margin - String.length name) ~f:(fun _ -> '.') in
  printf "%s %s %s\n" name dots status

let compare_incidents exact real ours =
  let tp = Set.inter real ours in
  if exact then Set.equal real ours
  else Set.equal real tp

let main name real ours exact =
  let of_ch c = In_channel.with_file c ~f:read in
  let real = of_ch real in
  let ours = of_ch ours in
  let passed = compare_incidents exact real ours in
  let status =  if passed then "PASS" else "FAILED" in
  print_status name status;
  if not passed then
    let () = log name real ours in
    exit 1

open Cmdliner

let doc = "Compares incidents from two files"

let test_name : string Term.t =
  let doc = "Name of the test to do" in
  Arg.(required & pos 0 (some string) None &
         info [] ~doc ~docv:"NAME")

let real : string Term.t =
  let doc = "File with real(proven) incidents" in
  Arg.(required & pos 1 (some non_dir_file) None &
       info [] ~doc ~docv:"REAL")

let ours : string Term.t =
  let doc = "File with new incidents" in
  Arg.(required & pos 2 (some non_dir_file) None &
         info [] ~doc ~docv:"FILE")

let exact : bool Term.t =
  let doc =
    "Compares incidents exactly, i.e. no False positives permitted " in
  Arg.(value & flag & info ["exact"] ~doc)

let prg =
  Term.(const main $test_name $real $ours $exact), Term.info "compare-incidents" ~doc

let _ = Term.eval prg
