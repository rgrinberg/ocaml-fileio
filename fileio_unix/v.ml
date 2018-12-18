let read p =
  let in_ = open_in p in
  let contents = really_input_string in_ (in_channel_length in_) in
  close_in in_;
  contents

let write p contents =
  let out = open_out p in
  Pervasives.output_string out contents;
  close_out out
