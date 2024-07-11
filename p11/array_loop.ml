(* val append : 'a array -> 'a array -> 'a array = <fun> *) 
let append a1 a2 = 
  let l1 = Array.length a1 in
  let l2 = Array.length a2 in 
  Array.init (l1 + l2) (function i -> if i < l1 then a1.(i) else a2.(i-l1))
;;

(* Pruebas append
   
# Array.append [|1;2;3|] [|4;5;6|];;
- : int array = [|1; 2; 3; 4; 5; 6|]
# append [|1;2;3|] [|4;5;6|];;      
- : int array = [|1; 2; 3; 4; 5; 6|]
# Array.append [||] [|4;5;6|];;     
- : int array = [|4; 5; 6|]
# append [||] [|4;5;6|];;      
- : int array = [|4; 5; 6|]
*)


(* val sub : 'a array -> int -> int -> 'a array = <fun> *)
let sub a ini len = if ini + len > Array.length a then raise (Invalid_argument ("Array.sub"))
else Array.init len (function i -> a.(ini+i));;

(* Pruebas sub 
   
# Array.sub [|1;2;3;4;5|] 2 2;;
- : int array = [|3; 4|]
# sub [|1;2;3;4;5|] 2 2;;
- : int array = [|3; 4|]
# Array.sub [|1;2;3;4;5|] 2 5;;  
Exception: Invalid_argument "Array.sub". 
# sub [|1;2;3;4;5|] 2 5;;                                               
Exception: Invalid_argument "Array.sub".
*)


(* val copy : 'a array -> 'a array = <fun> *) 
let copy a = Array.init (Array.length a) (function i -> a.(i)) ;;

(* Pruebas copy

# let v1 = Array.copy [|1;2;3|];;
val v1 : int array = [|1; 2; 3|]
# v1;;
- : int array = [|1; 2; 3|]

# let v1 = copy [|1;2;3|];;
val v1 : int array = [|1; 2; 3|]
# v1;;
- : int array = [|1; 2; 3|]
*)


(* val fill : 'a array -> int -> int -> 'a -> unit = <fun> *)
let fill a ini mov x = if ini + mov > Array.length a 
  then raise (Invalid_argument("Array.fill"))
  else for i = ini to mov + ini - 1 do
      a.(i) <- x;
    done 
;;

(* Pruebas fill
   
# let a = Array.make 5 0;;            
val a : int array = [|0; 0; 0; 0; 0|]
# a;;
- : int array = [|0; 0; 0; 0; 0|]
# Array.fill a 0 (Array.length a) 42;;
- : unit = ()
# a;;                                 
- : int array = [|42; 42; 42; 42; 42|]
  
# let a = Array.make 5 0;;            
val a : int array = [|0; 0; 0; 0; 0|]
# a;;                                 
- : int array = [|0; 0; 0; 0; 0|]
# fill a 0 (Array.length a) 42;;      
- : unit = ()
# a;;                           
- : int array = [|42; 42; 42; 42; 42|]
*)


(* val blit : 'a array -> int -> 'a array -> int -> int -> unit = <fun> *)
let blit a1 x1 a2 x2 n = 
  let l1 = Array.length a1 in
  let l2 = Array.length a2 in
  if (n + x1) > l1 || (n + x2) > l2 then raise(Invalid_argument("Array.blit"))
  else for i = 0 to n - 1 do
      a2.(x2 + i) <- a1.(x1 + i); 
    done
;;

(* Pruebas blit

# let origen = [|1; 2; 3; 4; 5|];;
val origen : int array = [|1; 2; 3; 4; 5|]
# let destino = [|0; 0; 0; 0; 0|];;
val destino : int array = [|0; 0; 0; 0; 0|]
# Array.blit origen 1 destino 2 3;;
- : unit = ()
# origen;;
- : int array = [|1; 2; 3; 4; 5|]
# destino;;
- : int array = [|0; 0; 2; 3; 4|]
  
# let origen = [|1; 2; 3; 4; 5|];;
val origen : int array = [|1; 2; 3; 4; 5|]
# let destino = [|0; 0; 0; 0; 0|];;
val destino : int array = [|0; 0; 0; 0; 0|]
# blit origen 1 destino 2 3;;
- : unit = ()
# origen;;
- : int array = [|1; 2; 3; 4; 5|]
# destino;;
- : int array = [|0; 0; 2; 3; 4|]
*)


(* val to_list : 'a array -> 'a list = <fun> *)
let to_list a = 
  let l = ref [] in
  let len = ref (Array.length a) in
  while !len - 1 >= 0 do 
    l := a.(!len - 1)::!l;
    len := !len - 1;
  done;
  !l
;; 

(* Pruebas to_list

# Array.to_list [|1;2;3;4|];;
- : int list = [1; 2; 3; 4]
# to_list [|1;2;3;4|];;      
- : int list = [1; 2; 3; 4]
*)


(* val iter : ('a -> unit) -> 'a array -> unit = <fun> *) 
let iter f a = 
  let len = Array.length a in 
  for i = 0 to len - 1 do
    f a.(i); 
  done
;;

(*Pruebas iter

En este caso la función iter no devuelve nada, por lo que
voy a probar con una función auxiliar.

let print (parametro : 'a) : unit = Printf.printf "%s\n" (string_of_int parametro);;

# Array.iter print [|1;2;3|];;
1
2
3
- : unit = ()
# iter print [|1;2;3|];;
1
2
3
- : unit = ()
*)

(* val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b array -> 'a = <fun> *)
let fold_left f n a =
  let c = ref 0 in 
  let x = ref n in
  let len = Array.length a in
  while !c < len do 
    x := f !x a.(!c);
    c := !c +1 ;
  done;
  !x
;;

(* Pruebas fold_left
   
# Array.fold_left (-) 0 [|1;2;3;4;5|];;
- : int = -15
# fold_left (-) 0 [|1;2;3;4;5|];;     
- : int = -15
# Array.fold_left (^) "" [|"Hola ";"buenas ";"tardes."|];;
- : string = "Hola buenas tardes."
# fold_left (^) "" [|"Hola ";"buenas ";"tardes."|];;     
- : string = "Hola buenas tardes."
*)


(* val for_all : ('a -> bool) -> 'a array -> bool = <fun> *)
let for_all f a = 
  let len = Array.length a in
  let i = ref 0 in 
  while !i < len && f a.(!i) do
    i := !i + 1;
  done;
  !i >= len
;;

(* Pruebas for_all

# Array.for_all (function x -> x mod 2 = 0) [|2;4;6;7|];;
- : bool = false
# for_all (function x -> x mod 2 = 0) [|2;4;6;7|];;     
- : bool = false
# Array.for_all (function x -> x mod 2 = 0) [|2;4;6|];;  
- : bool = true
# for_all (function x -> x mod 2 = 0) [|2;4;6|];;     
- : bool = true
*)


(* val exists : ('a -> bool) -> 'a array -> bool = <fun> *)
let exists f a = 
  let len = Array.length a in
  let i = ref 0 in 
  while !i < len && not(f a.(!i)) do
    i := !i + 1;
  done;
  !i < len
;;

(* Pruebas exists

# Array.exists (function x -> x mod 2 = 0) [|1;3;6|];;
- : bool = true
# exists (function x -> x mod 2 = 0) [|1;3;6|];;     
- : bool = true
# Array.exists (function x -> x mod 2 = 0) [|1;3;5|];;
- : bool = false
# exists (function x -> x mod 2 = 0) [|1;3;5|];;     
- : bool = false
*)


(* val find_opt : ('a -> bool) -> 'a array -> 'a option = <fun> *)
let find_opt f a =
  let len = Array.length a in
  let i = ref 0 in 
  while !i < len && not (f a.(!i)) do 
    i := !i + 1
  done;
  if !i >= len then None else Some a.(!i)
;;

(* Pruebas find_opt

# Array.find_opt (function x -> x mod 2 = 0) [|1;3;5|];;
- : int option = None
# find_opt (function x -> x mod 2 = 0) [|1;3;5|];;       
- : int option = None
# Array.find_opt (function x -> x mod 2 = 0) [|1;2;4;5|];;
- : int option = Some 2
# find_opt (function x -> x mod 2 = 0) [|1;2;4;5|];;     
- : int option = Some 2
*)