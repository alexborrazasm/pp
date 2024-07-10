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

(* Función a mejorar: 
let pair_i p =
  let rec find i =
  if pair i = p then i
  else find (i+1)
  in find 1;; 
*)

(* int * int -> int *)
let pair_i' (x,y) =
  let rec aux i (a,b) =
    if (a,b) = (x,y) then i
    else aux (i+1) (next (a,b))
  in aux 1 (1,1);;

(*
# crono pair_i (100,100);;
- : float = 7.72158500000000103
# crono pair_i' (100,100);;
- : float = 0.0013960000000032835 

Como podemos ver la función pair_i' es mucho más eficiente que la función pair_i.
La razón es que pair_i' evita la llamada recursiva a pair, que a su vez llama a next para avanzar en el recorrido.
Esto reduce considerablemente la cantidad de cálculos y llamadas recursivas.
*)

