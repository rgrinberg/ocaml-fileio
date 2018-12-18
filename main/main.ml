let run () =
  Fileio.write "foo1" "hello world";
  Fileio.copy "foo1" "foo2";
  let foo1 = Fileio.read "foo1" in
  let foo2 = Fileio.read "foo2" in
  print_endline (Printf.sprintf "foo1 = foo2 is %b" (foo1 = foo2))
