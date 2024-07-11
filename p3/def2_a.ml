let p x = 2. *. (6.0 *. asin 0.5) *. x;;

let area x = (6.0 *. asin 0.5) *. x *. x;;

let absf n = if n < 0. then -.n else n;;

let even = let par = function 0 -> true | x -> false in function x -> par (x mod 2);;

let next3 x = x - (x mod 3);;

let is_a_letter c = let a = int_of_char c in (a > 64 && a < 123);;
(* Los caracteres en ASCII que representan las letras van del 65 al 122 *)

let string_of_bool = function true -> "verdadero" | false -> "falso";;

---------------------REVISAR
