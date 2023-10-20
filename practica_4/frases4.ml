let p = (1 + 1, asin 1.), true;;
(* Definimos p como el par con primera componente el par (int, float) y como segunda bool
   val p : (int * float) * bool = ((2, 1.57079632679489656), true) *)

let (x, y), z = p;;
(* Definimos a x, y, z como x = int 2, y = float asin 1. y z = bool true
   val x : int = 2
   val y : float = 1.57079632679489656
   val z : bool = true *)

let p1, p2 = p in let p11, _ = p1 in (p2, 2 * p11);;
(* Expresión, ((p11, p12), p2) -> (p2, 2 * p11), de tipo bool * int
   - : bool * int = (true, 4) *)

let f (x, y) = 2 * x + y;;
(* Definimos f como una expresión del tipo int * int -> int
   val f : int * int -> int = <fun> *)

let f2 x y z = x + 2 * y + 3 * z;;
(* Definimos f2 como una expresión del tipo int -> int -> int -> int
   Ojo: No es una función del tipo int * int * int dado que no estamos pasando x,y,z
   val f2 : int -> int -> int -> int = <fun> *)

let g x y z = x (y, z);; mirar
(* Definimos g como una expresiín del tipo 
   val g : ('a * 'b -> 'c) -> 'a -> 'b -> 'c = <fun> *)

g fst 1 "hola";;
(* int 1
   - : int = 1 *)

g snd fst true;;
(* bool true
   - : bool = true *)

g f 2 3;;
(*
   - : int = 7 *)

g (function (f, x) -> f (f x)) (function x -> x * x) 3;;
(*
   - : int = 81 *)

let x, y , z = 1, 2, 3;;
(* Definimos x = int 1, y = int 2 and z = int 3
   val x : int = 1
   val y : int = 2
   val z : int = 3 *)

f2 x y z;;
(* Le pasamos a la expresión f2 3 enteros, x + y * 2 + z * 3 = int 14
   - : int = 14 *)

let x, y, z = y, z, x in f2 x y z;;
(* Cambiamos el valor de x -> y, y -> z and z -> x en f2; y + 2 * z + 3 * x = int 11
   - : int = 11 *)

f2 x y z;;
(* Igual que hace 2 frases, en las frase anterior el cambio fue local, int 14
   - : int = 14 *)

let swap (x,y) = y,x;;
(* Definomos swap, como la expresión que cambia en un par las 2 componentes
   val swap : 'a * 'b -> 'b * 'a = <fun> *)

let p = 1, 2;;
(* Definimos a p como el par 1, 2
   val p : int * int = (1, 2) *)

f p;;
(* Aplicamos f al par 1, 2, 2 * 1 + 2 = int 4
   - : int = 4 *)

let p = swap p in f p;;
(* Antes de aplicar f a p, cambiamos de sitio los pares de p, para esta operación solo
   - : int = 5 *)
f p;;
(* Lo mismo que hace 2 frases, en la frase anterior usamos una definición local.
   - : int = 4 *)
