(*  let rec fib n =
      if n <= 1 then n
      else fib (n-1) + fib (n-2)
*)

let rec fib n =
  if n <= 1 then n
  else fib (n-1) + fib (n-2);;

let fib_to n =
  let rec imp i =
    if fib i > n then ()
    else let _ = print_endline (string_of_int (fib i))
    in imp (i + 1)
  in imp 0;;

if Array.length Sys.argv <> 2 
  then print_endline("Invalid number of arguments")
else fib_to (int_of_string Sys.argv.(1));;