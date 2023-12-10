(* int -> int list *)
(*
let rec to0from n =
  if n < 0 then []
  else n :: to0from (n-1);;
*)
let to0from n =
  let rec aux acc m =
    if m = (n+1) then acc
    else aux (m::acc) (m+1)
  in aux [] 0;;

(* int -> int -> int list *)
(*
let rec fromto m n =
  if m > n then []
  else m :: fromto (m+1) n;;
*)
let fromto m n =
  let rec aux acc x =
    if x >= (n+1) then List.rev acc
    else aux (x::acc) (x+1)
  in aux [] m;;

(* 'a -> 'a list -> 'a list *)
(*
let rec remove x = function
  [] -> []
  | h::t -> if x = h then t
  else h :: remove x t;;
*)
let remove x list =
  let rec aux acc = function
    | [] -> List.rev acc
    | h::t -> 
      if h = x then aux acc t
      else aux (h::acc) t
  in aux [] list;;

(* 'a list -> 'a list *)
(*
let rec compress = function
  h1::h2::t -> if h1 = h2 then compress (h2::t)
  else h1 :: compress (h2::t)
  | l -> l;;
*)
let compress list =
  let rec aux acc = function
    | [] -> List.rev acc
    | [x] -> aux (x::acc) []
    | h1::h2::t -> 
      if h1 = h2 then aux (h2::acc) t
      else aux (h1::acc) (h2::t)
  in aux [] list;;

(* 'a list -> 'a list -> 'a list *)
(*
let append' = List.append
*)
let append' l1 l2 = List.rev_append (List.rev l1) l2;;

(* ('a -> 'b) -> 'a list -> 'b list *)
(*
let map' = List.map;;
*)
let map' l f = List.rev (List.rev_map l f);;

(* ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
(*
let fold_right' = List.fold_right;;
*)
let fold_right' f list acc =
  List.fold_left (fun acc' x -> f x acc') acc (List.rev list);;

(* int list -> int list *)
(*
let incseg l =
  List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;
*)

let incseg l =
  fold_right' (fun x t -> x::map' ((+) x) t) l [];;
