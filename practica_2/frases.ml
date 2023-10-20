(*x - y;;
   Error dado que x e y no es un valor definido
   Error: Unbound value x *)

let x = 1;;
(* Definimos x como int 1
   val x : int = 1 *)

(*x - y;;
   x está definido como int 1 pero y no tiene valor definido, error; unbound value y
   Error: Unbound value y *)

let y = 2;;
(* Defininos y como int 2
   val y : int = 2 *)

x - y;;
(* Ahora x vale 1 y y vale 2, int -1
   : int = -1 *)

let x = y in x - y;;
(* Para esta operación definimos x = y, entonces como y = 2, 2 (-2) = int 0 
   : int = 0 *)

(* z;;
   Error unbound value z
   Error: Unbound value z *)

let z = x + y;;
(* Definimos a z con el valor de x + y, como x = 1, y = 2 entonces z = int 3 
   val z : int = 3 *)

z;;
(* z esta definido como int 3
   : int = 3 *)

let x = 5;;
(* Defininos x como int 5
   : int = 5 *)

x + y;;
(* x = 5, y = 2, x + y = int 7
   : int = 7 *)

z;;
(* z estña definido como int 3
   int = 3 *)

let y = 5 in x + y;;
(* Temporalmente definimos y = 5, entocnes x + y, x = 5, = int 10
   : int = 10 *)

x + y;;
(* x + y, de forma global, 5 + 2 = 7 (int)
   : int = 7 *)

let x = x + y in let y = x * y in x + y + z;;
(* x = 5, y = 2 y z = 3, globalmente, entonces en x vale x + y en y = x * y y luego en y = x * y en x + y + z. Entonces x = 7, y = 7 * 2, y = 14, 5 + 14 + 3
   : int = 24 *)

x + y + z;;
(* 5 + 2 + 3 = 10
   : int = 10 *)

function x -> 2 * x;;
(* Expresión int -> int
   : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(* Aplicamos la expresión x a 3, 2 * 3 = int 6
   : int = 6 *)

(function x -> 2 * x) 2 + 1;; 
(* Aplicamos la expresión x a 2 y luego le sumamos 1, = int 5
   : int = 5 *)

let f = function x -> 2 * x;;
(* f es una expresión int -> int
   val f : int -> int = <fun> *)

f;;
(* val f : int -> int
   : int -> int = <fun> *)

f (2 + 1);;
(* La aplicamos la expresión de f, a 3, = int 6
   : int = 6 *)

f 2 + 1;;
(* Aplicamos la expresión de f, a 2 y le sumamos 1, = int 5
   : int = 5 *)

f x;;
(* Aplicamos la expresión f a x, x = 5, = int 10
   : int = 10 *)

let x = 100;;
(* Definimos x = int 100
val x : int = 100 *)

f x;;
(* Aplicamos la expresión f a x (definido = int 100), = int 200
   : int = 200 *)

let m = 1000;;
(* Definimos m = int 1000
   val m : int = 1000 *)

let g = function x -> x + m;;
(* Definimos g como la expresión x -> x + m;;
   val g : int -> int = <fun> *)

g;;
(* g : int -> int, es una expresión 
   : int -> int = <fun> *)

g 3;;
(* A la expresión g el int 3, 3 + 1000 = int 1003
   : int = 1003 *)

(* g 3.0;;
   Error de tipo, g es una expresión int -> int no float -> 
   Error: This expression has type float but an expression was expected of type int *)
   
let m = 7;;
(* Definimos m = int 7
   val m : int = 7 *)

g 3;;
(* La función definida g int -> int, suma 3 a su argumento, x + 1000 = 1003
   : int = 1003 *)

let istrue = function true -> true;;
(* Definimosistrue como la extresión true -> true, tipo bool -> bool
   Nos da un warning dado que hemos cubierto todo el rango de entrada de un bool, en una expresión bool -> bool
   Warning 8 [partial-match]: this pattern-matching is not exhaustive.
   val istrue : bool -> bool = <fun> *)

istrue;;
(* Expresion bool -> bool
   : bool -> bool = <fun> *)

istrue (1 < 2);;
(* como 1 < 2 es verdadero, = bool true
   : bool = true *)

(* istrue (2 < 1);;
   Va a dar algún error, dado que no hemos definido que pasa si el argumento es false
   Exception: Match_failure ("//toplevel//", 1, 14). *)

(* istrue 0;;
   Error de tipo, 0 no es un bool es un int
   Error: This expression has type int but an expression was expected of type bool *)

let iscero_v1 = function 0 -> true;;
(* Definimos iscero_v1 como el valor de la expresión 0 -> true
   Nos va a dar un warning, dado que es int -> bool, pero solo hemos definido que pasa si el int es 0
   Warning 8 [partial-match]: this pattern-matching is not exhaustive.
   val iscero_v1 : int -> bool = <fun> *)

iscero_v1 0;;
(* Como iscero nos devuelve el bool true si le pasamos un 0, no va a devolver bool true
   : bool = true *)

(* iscero_v1 0.;;
   Error de tipo, se esperaba un int y le pasamos un float
   Error: This expression has type float but an expression was expected of type int *)

(* iscero_v1 1;;
   Error de math, dado que solo tenemos definido que pasa si entra un 0 en esa función
   Exception: Match_failure ("//toplevel//", 1, 16). *)

let iscero_v2 = function 0 -> true | _ -> false;;
(* definimos iscero_v2, es iscero_v1, pero ahora está definido para todo el rango de entrada int -> bool
   val iscero_v2 : int -> bool = <fun> *)

iscero_v2 0;;
(* int -> bool, true si es 0, salida bool true
   : bool = true *)

iscero_v2 1;;
(* int -> bool, true su es 0, salida bool false
   : bool = false *)

(* iscero_v2 0.;;
   Error de tipo, se esperaba un int, pero le pasamos un float
   Error: This expression has type float but an expression was expected of type int *)

let all_to_true = function true -> true | false -> true;;
(* Le asignamos a all_to_true esa la función lamda, cualquier bool que le entre lo convierte a true
   val all_to_true : bool -> bool = <fun> *)

all_to_true (1 < 2);;
(* = bool true
   : bool = true *)

all_to_true (2 < 1);;
(* = bool true
   : bool = true *)

(* all_to_true 0;;
   Error de compilación, esperaba un valor bool y sin embargo me pasamos un int
   Error: This expression has type int but an expression was expected of type bool *)

let first_all_to_true = all_to_true;;
(* Definimos a first_all_to_true como la expresión definida anteriormente all_to_true
   val first_all_to_true : bool -> bool = <fun> *)

let all_to_true = function x -> true;;
(* Definimos all_to_true como una expresión cualquier_tipo -> bool, para cualquier entero siempre nos dará el bool true
   val all_to_true : 'a -> bool = <fun> *)

all_to_true (1 < 2);;
(* = bool true
   : bool = true *)

all_to_true (2 < 1);;
(* = bool true
   : bool = true *)

all_to_true 0;;
(* = bool true
   : bool = true *)

(* first_all_to_true 0;;
   Nos va a dar error de tipo, dado que es un valor bool -> bool
   Error: This expression has type int but an expression was expected of type bool *)

