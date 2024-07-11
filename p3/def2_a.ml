(* En vez de escribir:
let <f> = function <x> -> <e>

podemos escribir:
let <f> <x> = <e>

Asi, por ejemplo, podemos escribir:
let doble x = 2 * x

en lugar de:
let doble = function x -> 2 * x *)

let p x = 2. *. (6.0 *. asin 0.5) *. x;;

let area x = (6.0 *. asin 0.5) *. x *. x;;

let absf n = if n < 0. then -.n else n;;

let even x = x mod 2 = 0

let next3 x = x - (x mod 3);;

let is_a_letter x =
	if 65 <= int_of_char x && int_of_char x <= 90 then true 
	else 97 <= int_of_char x && int_of_char x <= 122

let string_of_bool x = if x then "verdadero" else "falso";;