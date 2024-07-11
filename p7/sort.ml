(* int list *)
let bigl = List.init 200_000 succ;;
(* # isort bigl;;
Stack overflow during evaluation (looping recursion?). *)

(* not tail recursive
('a -> 'a list -> 'a list)
let rec insert x = function
  | [] -> [x]
  | h::t -> if x <= h then x :: h :: t
            else h :: insert x t;;
*)

(* 'a -> 'a list -> 'a list *)
let insert_t x l = 
  let rec aux acc = function
    | [] -> List.rev (x :: acc)
    | h::t -> if x <= h then List.rev_append acc (x :: h :: t)
              else aux (h :: acc) t
  in aux [] l;;
            
(* not tail recursive
('a list -> 'a list)
let rec isort = function
  | [] -> []
  | h::t -> insert h (isort t);;
*)

(* 'a list -> 'a list *)
let isort_t l =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (insert_t h acc) t
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

(* Mirar si sort y sort_t devuelven lo mismo:

('a list -> 'a list -> bool)
let rec compare_list l1 l2 = 
  match l1,l2 with
  | [],[] | [],_ | _,[] -> true
  | h1::t1,h2::t2 -> if h1 = h2 then compare_list t1 t2
                    else false;; 
Función que compara si dos listas son iguales, la cual no hace falta dado que en Ocaml las podemos comparar
directamente con list1 = list2;;

# (isort lc1) = (isort_t lc1);;
- : bool = true
# (isort lc2) = (isort_t lc2);;
- : bool = true
# (isort ld1) = (isort_t ld1);;
- : bool = true
# (isort ld2) = (isort_t ld2);;
- : bool = true
# (isort lr1) = (isort_t lr1);;
- : bool = true
# (isort lr2) = (isort_t lr2);;
- : bool = true

Como demuestro arriba los dos algoritmos devuelven lo mismo.

Tiempos de ejecución isort:               | Tiempos de ejecución isort_t:
                                          | 
Ascendente:                               | Acendente:
                                          |
# crono isort lc1;;                       | # crono isort_t lc1;;
- : float = 0.000944000000000000394       | - : float = 2.10128299999999957
# crono isort lc2;;                       | # crono isort_t lc2;;
- : float = 0.00121800000000002462        | - : float = 9.901516
                                          |
Descendente:                              | Descendente:
                                          |
# crono isort ld1;;                       | # crono isort_t ld1;;
- : float = 1.19917199999999724           | - : float = 0.977622999999999465
# crono isort ld2;;                       | # crono isort_t ld2;;
- : float = 5.72591400000000306           | - : float = 0.00117299999999787019
                                          |
Aleatorio:                                | Aleatorio:
                                          |
# crono isort lr1;;                       | # crono isort_t lr1;;
- : float = 0.579094000000012             | - : float = 0.584761000000000308
# crono isort lr2;;                       | # crono isort_t lr2;;
- : float = 2.73208700000000348           | - : float = 4.54106299999999763

Como vemos arriba, en aleatorio no tenemos ninguna diferencia apreciable en tiempos de ejecución en la lista de 10_000, pero el la
20_000 si, en el caso de ascendente y descendente, hemos cambiado el mejor caso de insersición por el peor en la versión terminal, 
esto de debe a en la versiones terminales tenemos que voltear la lista en algunos casos.
*)

(* (‘a -> ‘a -> bool) -> ‘a list -> ‘a list *)
let isort_g ord l =
  let insert_t x l = 
    let rec auxi acc = function
      | [] -> List.rev (x :: acc)
      | h::t -> if ord x h then List.rev_append acc (x :: h :: t)
                else auxi (h :: acc) t
    in auxi [] l
  in
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (insert_t h acc) t
  in aux [] l;;

(* Comprobar que msort de el mismo resultado que isort en las listas lc1, lc2, ld1, ld2, lr1 y lr2:

# (isort lc1) = (msort lc1);;
- : bool = true
# (isort lc2) = (msort lc2);;
- : bool = true
# (isort ld1) = (msort ld1);;
- : bool = true
# (isort ld2) = (msort ld2);;
- : bool = true
# (isort lr1) = (msort lr1);;
- : bool = true
# (isort lr2) = (msort lr2);;
- : bool = true
*)

(* int list *)
let bigl2 = List.init 105_000 succ;;
(* # msort bigl2;;
Stack overflow during evaluation (looping recursion?).*)

(* not tail recursive
('a list -> 'a list * 'a list)
  let rec split l = match l with
    | h1::h2::t -> let t1, t2 = split t
                   in h1::t1, h2::t2
    | _ -> l, [];; 
*)

let rec split_t l =
  let rec aux l1 l2 = function
    | [] -> l1, l2
    | h::[] -> aux (h::l1) l2 []
    | h1::h2::rest -> aux (h1::l1) (h2::l2) rest
  in aux [] [] l;; 

(* not tail recursive
('a list * 'a list -> 'a list)
let rec merge (l1,l2) = match l1, l2 with
  |  [], l | l, [] -> l
  | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
                      else h2 :: merge (l1, t2);; 
*)

let merge_t (l1, l2) =
  let rec aux acc = function
    | [], l | l, [] -> List.rev(List.rev_append l acc)
    | h1 :: t1, h2 :: t2 ->
        if h1 <= h2 then aux (h1 :: acc) (t1, h2 :: t2)
        else aux (h2 :: acc) (h1 :: t1, t2)
  in aux [] (l1, l2);;

(* not tail recursive
('a list -> 'a list)
let rec msort l = match l with
  | [] | [_] -> l
  | _ -> let l1, l2 = split l
         in merge (msort l1, msort l2);;
*)

let rec msort' l = match l with
  | [] | [_] -> l
  | _ -> let l1, l2 = split_t l
        in merge_t (msort' l1, msort' l2);;

(* # msort' bigl2;;
- : int list = ... *)

(* a list *)
let bigl3 = [];;

(* En nuestro universo nunca va a ocurrir que msort' de stack overlow, dado que estás dividiento, para 1000 elementos llamas log2 1000 *)

(* Tiempos de msort': 

# crono msort' lc1;;
- : float = 0.0136729999999971596
# crono msort' lc2;;
- : float = 0.0273469999999917945
# crono msort' ld1;;
- : float = 0.0127059999999943329
# crono msort' ld2;;
- : float = 0.0282250000000061618
# crono msort' lr1;;
- : float = 0.0126199999999983
# crono msort' lr2;;
- : float = 0.0283009999999990214

Vemos que es un algoritmo mucho más estable que el de inserción, dado que tenemos tiempos muy similares para los 3 casos de entrada.
Es mucho más rapido además que inserción.
Además los tiempos proximos a ser lineales, se aproxima mucho a nlogn.
*)

(* Comparación de los tiempos de msort y msort':

# crono msort lr1;;                | # crono msort' lr1;;
- : float = 0.0111309999999917864  | - : float = 0.0126699999999999591
# crono msort lr2;;                | # crono msort' lr2;;
- : float = 0.0226660000000009632  | - : float = 0.0286589999999904421

Tenemos unos tiempos muy similares, se ve que estamos pagando un pequeño precio en tiempos de ejecución por hacer merge y split recursivas terminales.
*)

(* (‘a -> ‘a -> bool) -> ‘a list -> ‘a list *)
let rec msort_g ord l =
    let merge_t (l1, l2) =
      let rec aux_m acc = function
      | [], l | l, [] -> List.rev(List.rev_append l acc)
      | h1 :: t1, h2 :: t2 ->
          if ord h1 h2 then aux_m (h1 :: acc) (t1, h2 :: t2)
          else aux_m (h2 :: acc) (h1 :: t1, t2)
    in aux_m [] (l1, l2)
  in match l with
    | [] | [_] -> l
    | _ -> let l1, l2 = split_t l
          in merge_t (msort_g ord l1, msort_g ord l2);;
         
revisar-----------------