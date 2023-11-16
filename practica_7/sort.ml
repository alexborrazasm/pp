(* int list *)
let bigl = List.init 200_000 succ;;

(* 
('a -> 'a list -> 'a list)
let rec insert x = function
  | [] -> [x]
  | h::t -> if x <= h then x :: h :: t
            else h :: insert x t;; *)

(* 'a -> 'a list -> 'a list *)
let insert_t x l = 
  let rec aux acc = function
    | [] -> List.rev (x :: acc)
    | h::t -> if x <= h then List.rev_append acc (x :: h :: t)
              else aux (h :: acc) t
  in aux [] l;;
            
(* 
('a list -> 'a list)
let rec isort = function
  | [] -> []
  | h::t -> insert h (isort t);; *)

(* 'a list -> 'a list *)
let isort_t l =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (insert h acc) t
  in aux [] l;;

(* int -> int list *)
let rlist = fun x -> List.init x (fun _ -> Random.int 400_000);;
  
(* int list *)
let lc1 = List.init 10_000 succ;;

(* int list *)
let lc2 = List.init 20_000 succ;;

(* int list *)
let ld1 = List.rev (List.init 10_000 succ);;

(* int list *)
let ld2 = List.rev (List.init 20_000 succ);;

(* int list *)
let lr1 = rlist 10_000;;

(* int list *)
let lr2 = rlist 20_000;;

(* Mirar si sort y sort_t devuelve los mismo:

('a list -> 'a list -> bool)
let rec compare_list l1 l2 = 
  match l1,l2 with
  | [],[] | [],_ | _,[] -> true
  | h1::t1,h2::t2 -> if h1 = h2 then compare_list t1 t2
                    else false;; 
Función que compara si dos listas son iguales

Pruebas:

# compare_list (isort lc1) (isort_t lc1);;
- : bool = true

# compare_list (isort lc2) (isort_t lc2);;
- : bool = true

# compare_list (isort ld1) (isort_t ld1);;
- : bool = true

# compare_list (isort ld2) (isort_t ld2);;
- : bool = true

# compare_list (isort lr1) (isort_t lr1);;
- : bool = true

# compare_list (isort lr2) (isort_t lr2);;
- : bool = true

Como demuestro arriba los dos algoritmos devuelven lo mismo.

Tiempos de ejecución isort:               | Tiempos de ejecución isort_t:
                                          | 
Ascendente:                               | Acendente:
                                          |
# crono isort lc1;;                       | # crono isort_t lc1;;
- : float = 0.000427000000001953595       | - : float = 1.21500900000000911
# crono isort lc2;;                       | # crono isort_t lc2;;
- : float = 0.000987000000002069555       | - : float = 5.758004
                                          |
Descendente:                              | Descendente:
                                          |
# crono isort ld1;;                       | # crono isort_t ld1;;
- : float = 1.19917199999999724           | - : float = 0.0003479999999882466
# crono isort ld2;;                       | # crono isort_t ld2;;
- : float = 5.72591400000000306           | - : float = 0.0008600000000029695
                                          |
Aleatorio:                                | Aleatorio:
                                          |
# crono isort lr1;;                       | # crono isort_t lr1;;
- : float = 0.579094000000012             | - : float = 0.584761000000000308
# crono isort lr2;;                       | # crono isort_t lr2;;
- : float = 2.65610999999999819           | - : float = 2.62542700000000195

Como vemos arriba, en aleatorio no tenemos ninguna diferencia apreciable en tiempos de ejecución, pero en el caso de ascendente 
y descendente, hemos cambiado el mejor caso de insersición por el peor en la versión terminal, esto de debe a que cuando teminamos
de ordenar detemos que aplicar List.rev a la lista.
*) preguntal Moli



