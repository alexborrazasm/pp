();;
(* tipo de dato unit
   : unit = () *)

2+5*3;;
(* int multiplica 5 * 3 y luego le suma 2
   : int = 17 *)

1.25 *. 2.0;;
(* Multiplicación de floats, devuelve un float
   : float = 2.5 *)

(* 2 - 2.0;;
   Error de tipo, esta restando un float a un int
   Error: This expression has type float but an expression was expected of type *)

(* 3.0 + 2.0;;
   Suma de 2 floats con suma de enteros, va a dar error de tipo
   Error: This expression has type float but an expression was expected of type *)

5 / 3;;
(* División de un int por otro int, int 1)
   : int = 1 *)

5 mod 3;;
(* mod operador que devuelve el resto de la división entera
   : int = 2 *)

2.0 *. 3.0 ** 2.0;;
(* ** es "floating-point exponentiation" 3.0^2 * 2 = 18 (float)
   : float = 18 *)

2.0 ** 3.0 ** 2.0;;
(* 2.0 elevado a (3.0 elevado a 2.0) = 512 (float)
   : float = 512 *)

sqrt;;
(* Exoresión del tipo float -> float, nos devuelve la raíz cuadrada del argumento
   : float -> float = <fun> *)

(* sqrt 4;; 
   Error de tipo, esperaba un float y le estamos pasando un int
   Error: This expression has type int but an expression was expected of type float *)

int_of_float;;
(* Expresión del tipo float -> int, nos "convierte" un float a un int
   : float -> int = <fun> *)

float_of_int;;
(* Expresión del tipo int -> float, le pasamos un int y nos lo convierte a float
   : int -> float = <fun> *)

3.0 = float_of_int 3;;
(* Compara si al aplicar float_of_int a 3 es igual a 3.0, nos dira si es verdadero o falso, en este caso 3.0 = 3.0 true
   : bool = true *)

(*int_of_float -2.9;;
   Da error de tipo dado que - se usa para la diferencia de enteros, tendriamos que poner así int_of_float (-2.9) 
   Error: This expression has type float -> int but an expression was expected of type int *)

(*int_of_float 2.1 +. int_of_float (-2.9);;
   Error de tipo, estamos sumando con suma de float a dos int
   Error: This expression has type int but an expression was expected of type float *)

truncate;;
(* Expresión del tipo float -> int, trunca (corta) los valores decimales de un número real y devuelve el valor entero más cercano hacia cero
   : float -> int = <fun> *)

truncate 2.1 + truncate (-2.9);;
(* 2 + (-2) = 0
   : int = 0 *)

floor;;
(* Expresión del tipo float -> float, redondea un número real hacia el entero más grande que sea menor o igual al número original, manteniendo el tipo float
   : float -> float = <fun> *)

floor 2.1 +. floor (-2.9);;
(* 2. - 3. = -1.
   : float = -1 *)

ceil;;
(* Expresión float -> float, redondea un número hacia el próximo entero positivo más cercano, manteniendo el tipo
   : float -> float = <fun> *)

ceil 2.1 +. ceil (-2.9);;
(* 3. +. (-2.) = 1. 
   : float = 1 *)

int_of_char;;
(* Expresión tipo char -> int, nos da el valor correspondoente caracter en ASCII
   : char -> int = <fun>*)

int_of_char 'A';;
(* int = 65 que es el valor de A en ASCII
   : int = 65 *)

char_of_int;;
(* Expresión tipo int -> char, convierte un int en su correspondiente char en ASCII
   : int -> char = <fun> *)

char_of_int 66;;
(* Va a convertir el int 66 en el char 'B'
   : char = 'B' *)

Char.code;;
(* Igual que int_of_char, expresión char -> int
   : char -> int = <fun> *)

Char.code 'B';;
(* int = 66 que es el valor ASCII de B
   : int = 66 *)

Char.chr;;
(* Igual que char_of_int, expresion int -> char
   : int -> char = <fun> *)

Char.chr 67;;
(* char = 'C'
   : char = 'C' *)

'\067';;
(* Es una representación de un char en ASCII, es la C
   : char = 'C' *)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(* Opera los int valor_ASCII de a - A + M y luego saca el char corespodiente al resultado de la operación
   : char = 'm' *)

Char.lowercase_ascii;;
(* Expresión char -> char, que le pasamos un char en mayúsculas y nos lo devuelve en minúsculas
   : char -> char = <fun> *)

Char.lowercase_ascii 'M';;
(* char = 'm'
   : char = 'm' *)

Char.uppercase_ascii;;
(* Expresión char -> char, que le pasamos un char en minúsculas y no los devulve en mayúsculas
   : char -> char = <fun> *)

Char.uppercase_ascii 'm';;
(* char = 'M'
   : char = 'M' *)

"this is a string";;
(* Esto es una cadena
   : string = "this is a string" *)

String.length;;
(* Valor del tipo string to int, nos da la logitud de una cadena de caracteres
   : string -> int = <fun> *)

String.length "longitud";;
(* Nos va a devolver un int, que corresponda a al número de caracteres de "longitud"
   : int = 8 *)

(*"1999" + "1";;
   Error de tipo, estamos sumando 2 strings con el operador de suma de enteros
   Error: This expression has type string but an expression was expected of type int *)

"1999" ^ "1";;
(* El operador ^ concadena strings
   : string = "19991" *)

int_of_string;;
(* Expresión string -> int, "12" -> 12
   string -> int = <fun> *)

int_of_string "1999" + 1;;
(* 1999 + 1 = 2000
   : int = 2000 *)

"\065\066";;
(* Representación a la string "AB" en ASCII
   : string = "AB" *)

string_of_int;;
(* Expresión int -> string, int -> cadena de caracteres que representa el int
   : int -> string = <fun> *)

string_of_int 010;;
(* string = "10"
   : string = "10" *)

not true;;
(* Negamos el bool true, nos devolverá false
   : bool = false *)

true && false;;
(* && hace la operación lógica AND, va a devolver 0 (false)
   : bool = false *)

true || false;;
(* || hace la operación lógica OR, no va a devolver 1 (true)
   : bool = true *)

(1 < 2) = false;;
(* Nos va a comparar si la booleana, (1 es menor que 2) que es true, es igual false, como true no es igual a false va a devolver false
   : bool = false *)

"1" < "2";;
(* Nos evalua si la expresión booleana es cierta, el string 1 es menor que el string 2, nos va a devolver true
 : bool = true *)

2 < 12;;
(* Nos va a evaluar si la expresión boleana es cierta, en este caso si, va a devolver true
   : bool = true *)

"2" < "12";;
(* Evalua si la expresión booleana es cierta, en este caso el string "12" va a ser menor que "2", va a devolver false
   : bool = false *)

"uno" < "dos";;
(* Evaluna la expresión booleana, en esta caso es false, por que??
   : bool = false *)

if 3 = 4 then 0 else 4;;
(* Si 3 = 4, devuelve 0, pero como 3 != 4 va a devolver 4
   : int = 4 *)

if 3 = 4 then "0" else "4";;
(* Igual que el anterior, pero si 3 = 4 devulve la string "0" y si no la "4", en este caso va a devolver "4"
   : string = "4" *)

(*if 3 = 4 then 0 else "4";;
   En este caso Error de tipo, dado que las salidas son int 0 o string "4" 
   Error: This expression has type string but an expression was expected of type int *)

(if 3 < 5 then 8 else 10) + 4;;
(* Primero de evalua lo que está entre parentesis, el resultado del parentesis será 10 y luego le va a sumar 4, nos dara el int 12
   : int = 12 *)
