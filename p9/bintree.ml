type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree;;

(* Empty -> árbol vacío
   Node (r, i, d): 
      - Valor r en la raíz
      - Valor i y d como ramas izquierda y derecha, respectivamente. 
      
   Los valores de todos los nodos de la rama izquierda son menores o iguales que el valor de la raíz.
   El valor de la raíz es menor o igual1 que los valores de todos los nodos de la rama derecha.
   La rama izquierda y la derecha son también árboles de búsqueda. *)

(* 'a bintree -> 'a list *)
let in_order arbol =
  let rec aux acc = function
    | Empty -> acc
    | Node (r, i, d) -> aux (r :: aux acc d) i
  in aux [] arbol;;

(* ('a -> 'a -> bool) -> 'a bintree -> 'a -> 'a bintree *)
let rec insert ord tree x = match tree with
  | Empty -> Node (x, Empty, Empty)
  | Node (r, i, d) ->
    if ord x r then
      Node (r, insert ord i x, d)
    else
      Node (r, i, insert ord d x);;

(* ord es una relación de orden y tree es un árbol binario de búsqueda
   insert ord tree x sea un árbol binario de búsqueda conteniendo los nodos que tenía tree más un único 
   nodo adicional con valor x *)

(* ('a -> 'a -> bool) -> 'a list -> 'a bintree *)
let bst ord lst =
  let rec aux acc = function
     | [] -> acc
     | h::t -> aux (insert ord acc h) t
  in aux Empty lst;; 

  (* ('a -> 'a -> bool) -> 'a list -> 'a list *)
let qsort ord lst = in_order (bst ord lst);;  
