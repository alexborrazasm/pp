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

(* No reculsiva terminal
let init n f =
  let rec aux m list = match (m,list) with
      0,[] -> []
    | 0,[_] -> list
    | _,[] -> f (n - m)::aux (m - 1) list  
    | _, h::t -> f (n - m)::aux (m - 1) t
  in aux n [];;
*)

let init n f =
  if n < 0 then raise (Invalid_argument "List.init")
  else
    let rec aux m list = match (m,list) with
        0,[] -> []
      | 0, list -> 
        let rec rev lst =
          let rec rev_aux acc = function
              [] -> acc
            | h::t -> rev_aux (h::acc) t
          in rev_aux [] lst
        in rev list
      | _,[] -> aux (m - 1) [f (n - m)]
      | _, h::t -> aux (m - 1) (f (n - m)::h::t)
    in aux n [];;

(* Primera nth que se me ocurre, complicada al absurdo
let nth lst n =
  let rec aux m l= 
    if m = n then 
      match l with
      [] -> raise (Failure "nth")
    | h::r -> h
    else 
      match l with 
      [] -> raise (Failure "nth")
    | h::t -> aux (m+1) t
  in aux 0 lst;;
*)

let rec nth l n = match (n, l) with
    _, [] -> raise (Failure "nth")
  | 0, h::_ -> h
  | m, _::t -> nth t (n - 1);;
 
let rec append l1 l2 = match l1 with
    [] -> l2
  | h::t -> h :: append t l2;;
  (* not tail recursive *)
 
 let rec rev_append l1 l2 = match l1 with
    [] -> l2
  | h::t -> rev_append t (h::l2);;
 
let rec rev lst =
  let rec rev_aux acc = function
      [] -> acc
    | h::t -> rev_aux (h::acc) t
  in rev_aux [] lst;;

let rec concat lst_lsts = match lst_lsts with
    [] -> []
  | []::t -> concat t
  | (h::t)::rest -> h :: concat (t :: rest);;
  (* not tail recursive *)
 
let flatten = concat;;
 (* not tail recursive *)
 
let rec split list_pairs =  match list_pairs with
    [] -> [], []
  | (x, y)::rest -> 
    let xs, ys = split rest in 
    x :: xs, y :: ys;;  revisar
  (* not tail recursive *)
 
let rec combine l1 l2 = match l1,l2 with
    [],[] -> []
  | [],_ | _, [] -> raise (Invalid_argument "List.combine")
  | x::rest_x,y::rest_y -> (x,y) :: combine rest_x rest_y;;
 (* not tail recursive *)
 
let rec map f list = match list with
    [] -> []
  | h::t -> let result = f h in
    result :: map f t;;
 (* not tail recursive *)
 
let rec map2 f l1 l2 = match l1,l2 with
    [],[] -> []
  | [],_ | _,[] -> raise (Invalid_argument "List.map2")
  | x::rest_X,y::rest_y -> let result = f x y in
    result :: map2 f rest_X rest_y;;
 (* not tail recursive *)
 
let rev_map f list =
  if list = [] then []
  else 
    let rec aux entrada salida = match entrada with
        [] -> salida
      | h::t -> aux t ((f h)::salida)
    in aux list [];; 
 
let rec for_all f list = match list with
    [] -> true
  | h::t -> 
    if f h = true then for_all f t
    else false;;
 
let rec exists f list = match list with
    [] -> false
  | h::t ->
    if f h = false then exists f t
    else true;;
 
let rec mem x list = match list with
    [] -> false
  | h::t -> if h = x then true
            else mem x t;;
 
let rec find f list = match list with
    [] -> raise Not_found
  | h::t -> if f h then h
          else  find f t;;
 
let filter f list = 
  let rec aux results l = match l with
    [] -> rev results
  | h::t -> if f h then aux (h::results) t
            else aux results t
  in aux [] list;;
 
let find_all = filter;;
 
let partition f l =
  let rec part si no = function
    [] -> (rev si, rev no)
  | h::t -> if f h then part (h :: si) no t
            else part si (h :: no) t
  in part [] [] l;;
 
let rec fold_left f acc list = match list with
    [] -> acc
  | h::t -> fold_left f (f acc h) list;;
 
let rec fold_right f list acc = match list with
    [] -> acc
  | h::t -> f h (fold_right f t acc);;
 (* not tail recursive *)
 
let rec assoc x = function
    [] -> raise Not_found
  | (a,b)::t -> if x = a then b
                else assoc x t;;

 
let mem_assoc x = function
    [] -> false
  | (a,_)::t -> if x = a then true
                else assoc x t;;
 
let rec remove_assoc x = function
    [] -> []
  | (a,b)::t -> if a = x then t
                else (a,b) :: remove_assoc x t;;  
 (* not tail recursive *)