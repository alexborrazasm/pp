(* val length : 'a list -> int = <fun> *)
let length l = 
  let list = ref l in
  let a = ref 0 in 
  while !list <> [] do 
    a := !a + 1;
    list := List.tl !list; 
  done;
  !a 
;;

(* Pruebas length

# List.length [1;2;3];;
- : int = 3   
# length [1;2;3];;
- : int = 3  
*)


(* val last : 'a list -> 'a = <fun> *)
let last l = 
  let list = ref l in 
  if !list = [] then raise (Failure("last")) 
  else while List.tl !list <> [] do 
      list := List.tl !list; 
    done;
  List.hd !list
;;

(* Pruebas last

En este caso la función last no existe en el modulo list, 
pero la prueba se hizo con la función de ejemplo del enunciado.

# List.last ['a';'b';'c';'d'];;
- : char = 'd'  
# last ['a';'b';'c';'d'];;
- : char = 'd'

# List.last [];;
Exception: Failure "last".
# last [];;
Exception: Failure "last".
*)
  

(* val nth : 'a list -> int -> 'a = <fun> *)
let nth l n = 
  if n < 0 then raise (Invalid_argument ("List.nth")) else  
    let list = ref l in
    let x = ref n in 
    while !x <> 0 && !list <> [] do
      list := List.tl !list;
      x := !x - 1;
    done;
    if !list = [] then raise (Failure ("nth")) else List.hd !list
;;

(* Pruebas nth

# List.nth [1;2;3;4;5;6] 4;;   
- : int = 5
# nth [1;2;3;4;5;6] 4;;
- : int = 5

# List.nth [1;2;3] (-1);;
Exception: Invalid_argument "List.nth".
# nth [1;2;3] (-1);;
Exception: Invalid_argument "List.nth".

# List.nth [1;2;3] (4);;
Exception: Failure "nth".
# nth [1;2;3] (4);; 
Exception: Failure "nth".
*)
  
(* val rev : 'a list -> 'a list = <fun> *)
let rev l = 
  let l1 = ref l in 
  let l2 = ref [] in 
  while !l1 <> [] do
    l2 := List.hd !l1 :: !l2;
    l1 := List.tl !l1; 
  done;
  !l2
;;

(* Pruebas rev

# List.rev ["Buenos";"dias"];;
- : string list = ["dias"; "Buenos"]
# rev ["Buenos";"dias"];;
- : string list = ["dias"; "Buenos"]
*)


(* val append : 'a list -> 'a list -> 'a list = <fun> *)
let append l1 l2 = 
  let l1r = ref (rev l1) in
  let l2r = ref l2 in 
  
  while !l1r <> [] do
    l2r := List.hd !l1r :: !l2r;
    l1r := List.tl !l1r;
  done;
  !l2r
;;

(* Pruebas append

# List.append [4;5;6] [1;2;3];;
- : int list = [4; 5; 6; 1; 2; 3]
# append [4;5;6] [1;2;3];;
- : int list = [4; 5; 6; 1; 2; 3]
*)


(* val concat : 'a list list -> 'a list = <fun> *) 
let concat l = 
  let l1 = ref l in 
  let l2 = ref [] in
  while !l1 <> [] do
    l2 := append !l2 (List.hd !l1);
    l1 := List.tl !l1;
  done;
  !l2
;; 

(* Pruebas concat

# List.concat [[1;2];[3;4];[5;6]];;
- : int list = [1; 2; 3; 4; 5; 6]
# concat [[1;2];[3;4];[5;6]];;     
- : int list = [1; 2; 3; 4; 5; 6]
*)


(* val for_all : ('a -> bool) -> 'a list -> bool = <fun> *) 
let for_all f l = 
  let list = ref l in 
  while !list <> [] && f (List.hd !list) do 
    list := List.tl !list; 
  done;
  !list = []
;;

(* Pruebas for_all

# List.for_all (function x -> x mod 2 = 0) [2;4;6;7];;
- : bool = false
# for_all (function x -> x mod 2 = 0) [2;4;6;7];;     
- : bool = false
# List.for_all (function x -> x mod 2 = 0) [2;4;6];;  
- : bool = true
# for_all (function x -> x mod 2 = 0) [2;4;6];;     
- : bool = true
*)


(* val exists : ('a -> bool) -> 'a list -> bool = <fun> *)
let exists f l = 
  let list = ref l in 
  while !list <> [] && not (f (List.hd !list)) do 
    list := List.tl !list; 
  done;
  !list <> []
;; 

(* Pruebas exists

# List.exists (function x -> x mod 2 = 0) [1;3;6];;
- : bool = true
# exists (function x -> x mod 2 = 0) [1;3;6];;     
- : bool = true
# List.exists (function x -> x mod 2 = 0) [1;3;5];;
- : bool = false
# exists (function x -> x mod 2 = 0) [1;3;5];;     
- : bool = false
*)
  

(* val find_opt : ('a -> bool) -> 'a list -> 'a option = <fun> *)
let find_opt f l = 
  let list = ref l in 
  while !list <> [] && not (f (List.hd !list))  do 
    list := List.tl !list; 
  done;
  if !list = [] then None else Some (List.hd !list)
;; 

(* Pruebas find_opt

# List.find_opt (function x -> x mod 2 = 0) [1;3;5];;
- : int option = None
# find_opt (function x -> x mod 2 = 0) [1;3;5];;       
- : int option = None
# List.find_opt (function x -> x mod 2 = 0) [1;2;4;5];;
- : int option = Some 2
# find_opt (function x -> x mod 2 = 0) [1;2;4;5];;     
- : int option = Some 2
*)


(* val iter : ('a -> unit) -> 'a list -> unit = <fun> *)
let iter f l = 
  let list = ref l in
  while !list <> [] do
    f (List.hd !list);
    list := List.tl !list;
  done
;;

(*Pruebas iter

En este caso la función iter no devuelve nada, por lo que
voy a probar con una función auxiliar.

let print (parametro : 'a) : unit = Printf.printf "%s\n" (string_of_int parametro);;

# List.iter print [1;2;3];;
1
2
3
- : unit = ()
# iter print [1;2;3];;
1
2
3
- : unit = ()
*)


(* val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun> *)
let fold_left f n l =
  let list = ref l in 
  let x = ref n in
  while !list <> [] do 
    x := f !x (List.hd !list);
    list := List.tl !list;
  done;
  !x
;;

(* Pruebas fold_left
   
# List.fold_left (-) 0 [1;2;3;4;5];;
- : int = -15
# fold_left (-) 0 [1;2;3;4;5];;     
- : int = -15
# List.fold_left (^) "" ["Hola ";"buenas ";"tardes."];;
- : string = "Hola buenas tardes."
# fold_left (^) "" ["Hola ";"buenas ";"tardes."];;     
- : string = "Hola buenas tardes."
*)