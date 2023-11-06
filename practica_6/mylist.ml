(* Las funciones que deben implementarse de modo recursivo terminal son: 
length, compare_lengths, compare_length_with, init, nth, rev_append, rev, rev_map, for_all, exists, mem, find, find_all, filter, partition, fold_left,
 assoc y mem_assoc. *)

let hd = function
    h :: _ -> h
  | [] -> raise (Failure "hd");;

let tl = function
    [] -> raise (Failure "tl")
  | _ :: t -> t;;

(* No reculsiva terminal
let rec length = function
    [] -> 0
  | _::t -> 1 + length t;;
*)

let length l =
  let rec aux list c = match list with 
    [] -> c
  | _::t -> aux t (c+1)
  in aux l 0;;

(* 2 compare_lenhths alternativos:

primero: 
let compare_lengths list1 list2 =
  let rec aux dates = match dates with
      [], [] -> 0
    | [], _  -> -1
    |  _, [] -> 1
    | _::t1, _::t2 -> aux (t1,t2)
  in aux (list1,list2);;

segundo:
let rec compare_lengths l1 l2 =
  (function
      [], [] -> 0
    | [], _  -> -1
    |  _, [] -> 1
    | _::t1, _::t2 -> compare_lengths t1 t2) (l1, l2);;
*)

let rec compare_lengths l1 l2 = match (l1,l2) with
      [], [] -> 0
    | [], _  -> -1
    |  _, [] -> 1
    | _::t1, _::t2 -> compare_lengths t1 t2;;
 
let rec compare_length_with list n = 
  let rec aux l c = match (l,c) with
      [],0 -> 0
    | [],_ -> -1
    | [_],0 -> 1
    | _::t,_ -> aux t (c-1)
  in aux list n;;

let init
 
let nth
 
let append
 (* not tail recursive *)
 
 let rev_append
 
let rev
 
let concat
 (* not tail recursive *)
 
let flatten
 (* not tail recursive *)
 
let split
 (* not tail recursive *)
 
let combine
 (* not tail recursive *)
 
let map
 (* not tail recursive *)
 
let map2
 (* not tail recursive *)
 
let rev_map
 
let for_all
 
let exists
 
let mem
 
let find
 
let filter
 
let find_all
 
let partition
 
let fold_left
 
let fold_right
 (* not tail recursive *)
 
let assoc
 
let mem_assoc
 
let remove_assoc
 (* not tail recursive *)