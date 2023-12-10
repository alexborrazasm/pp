open Bintree
open Bintree_opt

let rec power2 n =
    if n = 0 then 1
    else if n mod 2 = 0
         then let n = power2 (n/2) in n * n
         else 2 * power2 (n-1) ;;

(* tamaño del árbol binario perfecto de altura h *)
let size h = power2 h - 1;;

let rec log2 = function (* solo para n >= 1 *)
    1 -> 0
  | n -> 1 + log2 (n / 2);;
  
(* calculo del tamaño de la rama izda y la rama dcha
de un árbol casi completo de tamaño n, si n >= 2 *)
let left_right n = (* n >= 2 *)
    let left_h = log2 n in
    let s1 = size left_h in
    let resto = n - s1 in
    let left = let lastrow = power2 (left_h - 1) in 
               (s1 - lastrow) + min resto lastrow in
    left, n - 1 - left;;
      
let rec cut l = function (* lista l sin los n primeros elementos *)
    0 -> l
  | n -> cut (List.tl l) (n-1);;

let act l = (* árbol casi completo a partir de una lista l *)
    let rec aux l = function 
        0 -> Empty
      | 1 -> Node (List.hd l, Empty, Empty)
      | n -> let l_size, r_size = left_right n in
             Node (List.hd l, aux (cut l 1) l_size,
                              aux (cut l (1 + l_size)) r_size)
    in aux l (List.length l);;
    
