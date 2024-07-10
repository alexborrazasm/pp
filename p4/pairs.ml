(* int * int -> int * int *)
let next = function
  | 1,b -> if (1 + b) mod 2 = 0 then 1, b + 1 
           else 2, b - 1
  | a,1 -> if (1 + a) mod 2 = 0 then a - 1, 2 
           else a + 1, 1
  | a,b -> if (a + b) mod 2 = 0 then a - 1,b + 1 
           else a + 1, b - 1;;   

(* int * int -> int -> int * int *)
let steps_from (x, y) n =
  let rec aux (a, b) n =
    match n with
    | 0 -> (a, b)
    | _ -> aux (next (a, b)) (n - 1)
  in aux (x, y) n;;

(* int -> int * int *)
let pair n =
  let rec aux (a,b) = function
    | 1 -> next(a,b)
    | i -> aux (next (a,b)) (i-1)
  in aux (0,1) n;; 