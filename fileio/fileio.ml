include V

let copy p1 p2 =
  let contents = read p1 in
  write p2 contents
