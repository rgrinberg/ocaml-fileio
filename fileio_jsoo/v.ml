open Js_of_ocaml

class type buffer = object
  method toString : Js.js_string Js.t Js.meth
end

module Fs = struct
  class type fs = object
    method readFileSync : Js.js_string Js.t -> buffer Js.t Js.meth
    method writeFileSync : Js.js_string Js.t -> Js.js_string Js.t -> unit Js.meth
  end

  let require_module s =
    Js.Unsafe.fun_call
      (Js.Unsafe.js_expr "require")
      [|Js.Unsafe.inject (Js.string s)|]

  let fs : fs Js.t = require_module "fs"
end

let read p =
  (Fs.fs##readFileSync (Js.string p))
  ## toString
  |> Js.to_string

let write path contents =
  Fs.fs##writeFileSync (Js.string path) (Js.string contents)
