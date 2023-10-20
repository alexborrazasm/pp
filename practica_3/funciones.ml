(* Intente predecir y luego compruebe con el compilador interactivo qué sucede al compilar y
ejecutar las siguientes frases: *)

let rec factorial = function 0 -> 1 | n -> n * factorial (n-1);;
(* Definición reculsiva que calcula el factorial del int que le pasemos como argumento 
   val factorial : int -> int = <fun> *)
factorial 0 + factorial 1 + factorial 2;;
(* 0! + 1! + 2!, 1 + 1 + 2 = int 4 
   - : int = 4 *)
factorial 10;;
(* - : int = 3628800 *)
factorial 100;;
(* Nos va a dar 0, debido al desbordamiento de enteros
   - : int = 0 *)
factorial (-1);;
(* No hemos definido que pasa si el argumento es un número negativo y tenemos un bucle infinito
   Stack overflow during evaluation (looping recursion?). *)

(* Defina en OCaml las siguientes funciones: *)
(* sumto: int -> int, de modo que sumto n devuelva la suma de todos los naturales hasta el n (incluido) *)
let rec sumto = function 0 -> 0| n -> n + sumto (n-1);;
(* exp10: int -> int, de modo que, para cualquier n >= 0, exp10 n devuelva el valor de 10^n *)
let rec exp10 = function 0 -> 1| n -> 10 * exp10 (n-1);;
(* num_cifras: int -> int, de modo que num_cifras n devuelva el número de cifras de la representación decimal de n (el signo no cuenta como cifra) *)
let rec num_cifras n = let n = if n < 0 then -n else n in (function true -> 1 | false -> 1 + num_cifras (n / 10)) (n < 10);;
(* sum_cifras: int -> int, de modo que, sum_cifras n devuelva la suma de las cifras correspondientes a la representación decimal de n. *)
let rec sum_cifras n = let n = if n < 0 then -n else n in (function true -> n | false -> (n mod 10) + sum_cifras (n / 10)) (n < 10);;
