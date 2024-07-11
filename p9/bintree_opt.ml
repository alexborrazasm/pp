open Bintree

(* ('a -> 'a -> bool) -> 'a bintree -> bool *)
let rec is_bst ord tree =
  let rec aux = function
    | [] | [_] -> true
    | h1::h2::t -> 
      if ord h1 h2 then aux t
      else false
  in aux (in_order tree);;

(* 'a bintree -> 'a list *)
let rec bfs tree = 
  let rec aux acc = function
    | Empty -> acc
    | Node (r, i, d) -> aux (aux r i) d
  in aux [] tree;;

let bfs tree =
  let rec aux acc = function
    | [] -> List.rev acc
    | Empty :: rest -> aux acc rest  (* Ignoramos los nodos vacíos *)
    | Node (r, i, d) :: rest ->
      let cola = rest @ [i; d] in
      aux (r :: acc) cola
    in aux [] [tree];;

(* 'a bintree -> 'a list *)
let bfs' tree = 
  let rec aux acc = function
    | [] -> List.rev acc
    | Empty :: rest -> aux acc rest  (* Ignoramos los nodos vacíos *)
    | Node (r, i, d) :: rest ->
      let cola = List.rev_append (List.rev rest) [i; d] in  (* Hacemos un List.append terminal *)
      aux (r :: acc) cola
    in aux [] [tree];;

(* 'a bintree -> bool *)
let perfecto tree = 
  let rec altura = function
      | Empty -> 0
      | Node (_, i, d) -> 1 + max (altura i) (altura d)
  in 
  let nodos_p = int_of_float (2. ** float_of_int (altura tree)) - 1
  in 
  let nodos = List.length (bfs' tree)
  in
  nodos = nodos_p;;

(* 'a bintree -> bool *)
let rec casi_completo =
  let rec altura = function
  | Empty -> 0
  | Node (_, i, d) -> 1 + max (altura i) (altura d)
  in function
    | Empty -> true
    | Node(_, i, d) -> let hi = altura i and hd = altura d in 
        ( hi = hd && (perfecto i) && (casi_completo d)) ||
        ( hi = (hd + 1) && (casi_completo i) && perfecto d);;

REVISAR-------------