# GEI-PP 614G010142324 - Paradigmas de Programación - Grao en Enxeñaría Informática (2023-2024)

Repositorio de las prácticas en [OCaml](https://ocaml.org/).

Este README tiene una parte inicial de como instalar [OCaml](#como-instalar-ocaml), luego una parte con un resumen de los [apuntes tomados en clase](#el-lenguaje-de-programación-ocaml) y un [anexo](#anexo).

Nota prácticas final: 2.0/2.0.

# Indice

1. [Como instalar OCaml](#como-instalar-ocaml)
   
   1.1 [Configurar Visual Studio Code](#configurar-visual-studio-code)

2. [Apuntes OCaml](#el-lenguaje-de-programación-ocaml)

   2.1 [El compilador](#el-compilador)

   2.2 [Comentarios](#comentarios)

   2.3 [Tipos de datos](#tipos-de-datos-en-ocaml)

   2.4 [Tipos Primitivos](#tipos-primitivos)

   2.5 [Operaciones con Tipos Primitivos](#operaciones-con-tipos-primitivos)

   2.6 [Conversiones de tipo](#conversiones-de-tipo)

   2.7 [El tipo unit](#el-tipo-unit)

   2.8 [Funciones](#funciones-en-ocaml)

   2.9 [Funciones lamda](#funciones-lamda)

   2.10 [Definiciones](#definiciones-en-ocaml)

   2.11 [Evaluación de expresiones](#evaluación-de-expresiones)

   2.12 [Librerias](#librerias-en-ocaml)

   2.13 [Funciones de funciones](#funciones-de-funciones)

   2.14 [Operadores Lógicos](#operadores-lógicos)

   2.15 [if-then-else](#if-then-else)

   2.16 [Tuplas de datos o pares](#tuplas-de-datos-o-pares)

   2.17 [La Recursividad](#la-recursividad)

   2.18 [Listas](#listas)

   2.19 [Los errores de ejecución](#los-errores-de-ejecución)

   2.20 [Los valores del tipo 'a option](#los-valores-del-tipo-a-option)

   2.21 [Definir tipos de datos](#definir-tipos-de-datos)

   2.22 [Árboles binarios](#árboles-binarios)

   2.23 [La parte imperactiva de OCaml](#la-parte-imperactiva-de-ocaml)

   2.24 [egistros de datos](#registros-de-datos-en-ocaml)

   2.25 [Un contador](#un-contador)

   2.26 [Objetos](#objetos-en-ocaml)

3. [Anexo](#anexo)
   
   3.1 [Límites de precisión OCaml](#límites-de-precisión-ocaml)

   3.2 [Medir tiempos de ejecución](#medir-tiempos-de-ejecución)

   3.3 [El Pattern Matching](#el-pattern-matching)

   3.4 [TIPS](#tips)

   3.5 [Números aleatorios](#números-aleatorios)

   3.6 [Llamar una función con un simbolo](#como-llamar-una-función-con-un-simbolo)


# ¿Como instalar OCaml?

1. **Abrimos una terminal en linux**
    
    en debian/ubuntu/mint:
    ```bash
    sudo apt update 
    sudo apt upgrade
    sudo apt install ocaml opam rlwrap dune
    ```
    en Arch o derivadas:
    ```bash
    sudo pacman -Syyu ocaml opam rlwrap dune
    ```
    en Red Hat/CentOS/Fedora:
    ```bash
    sudo dnf upgrade
    sudo dnf install ocaml opam rlwrap dune
    ```

2. **El compilador interectivo**

    Para abrir el compilador interactivo de ocaml, basta con escribir `ocaml` en la terminal.

    El compilador no tiene ayudas para poder editar texto, por instalamos junto a el `rlwrap`, que no va a dejar editar el comando escribo o recordar anteriores con las flechas del taclado.

    Para abrir ocaml con rlwrap:

    ```bash
    rlwrap ocaml
    ```

    Nota: Para salir pulsamos `Ctrl + d`.

## Configurar [Visual Studio Code](https://code.visualstudio.com/)

Si queremos utilizar un IDE más cómodo que un bloq de notas. Además nos dice los tipos de las funciones antes de compilarlas.

Instalamos la extensión de [OCaml](https://marketplace.visualstudio.com/items?itemName=ocamllabs.ocaml-platform).

Configuramos opam para instalar las dependencias que necesita la extensión:

1. Iniciamos opam
    
    ```bash 
    opam init
    ```
    Le damos que `yes` a todo.

2. Instalamos las dependencias encesarias para la extensión:

    ```bash
    opam install ocaml-lsp-server ocamlformat
    ```

Finalizado esto, cerramos y volvemos a abrir Visual Studio Code y debería estar listo.

TIP: Para trabajar más cómodo lo suyo es abrir una terminal en Visual Studio Code con `rlwrap ocaml` y escribir las funciones en Visual Studio Code.

# El lenguaje de programación [OCaml](https://ocaml.org/)

OCaml (Objective Caml) es un lenguaje de programación de propósito general, de alto nivel y multiparadigma. Combina características de la programación funcional, imperativa y orientada a objetos.

## El compilador

OCaml tiene varios compiladores entre ellos:

### ocamlopt

Traduce el código fuente de OCaml a código máquina nativo. Genera ejecutables muy eficientes y rápidos, aprovechando al máximo las capacidades del hardware. Los binarios de este compilador no se pueden ejecutar en cualquier máquina.

Uso:

```bash
ocamlopt nombre.ml -o nombre_ejecutable
```

### ocamlc

Traduce el código fuente de OCaml a un bytecode intermedio que puede ser ejecutado por la máquina virtual de OCaml (ocamlrun). Los ejecutables de bytecode son portables y pueden ejecutarse en cualquier plataforma que tenga la máquina virtual OCaml instalada.
Uso:

```bash
ocamlc nombre.ml -o nombre_ejecutable
```

Nota: Para ejecutar cualquiera de los binarios generados tanto por `ocamlc` o `ocamlopt` se hace así:

```bash
./nombre_ejecutable
```

### Compilador interactivo (REPL)

OCaml proporciona un REPL (Read-Eval-Print Loop) o toplevel system, que permite la ejecución interactiva de comandos OCaml. El comando para iniciar el REPL, como vimos más arriba es `ocaml`.

Aqui escribimos el código lo compila y inmediatamente lo ejecuta. Y Además nos va a dar información de lo que ocurrio.

Es muy útil para aprender.

Con `;;` le indicamos al compilador que terminamos de escribir el código.

Este compilador nos cuenta lo que pasa, aunque no haya "prints".

## Comentarios

Para dejar comentarios en el código en Ocaml:

```ocaml
(* Esto es un comentario *)
```

## Tipos de datos en OCaml

OCaml tiene un sistema de tipos estático y fuerte.

El compilador para poder compilar tiene que ser capaz de averiguar que tipo de la expresión. Por ejemplo un float (1.45) o int (56).

Esto pasa duracte la fase de compilación. Tipado estático.

En otros lenguajes puede ser dinámico (se decide durante la ejecución).

## Tipos Primitivos

### Enteros (int): Representan números enteros
En el compilador interactivo:
```ocaml
# 1;;
- : int = 1
```

### Punto flotante (float): Representan números de punto flotante (decimales)

```ocaml
# 1.7;;
- : float = 1.7
```

### Booleanos (bool): Representan valores booleanos (true o false)

```ocaml
# true;;
- : bool = true
# false;;
- : bool = false
```

### Caracteres (char): Representan caracteres individuales

```ocaml
# 'a';;
- : char = 'a'
# 'C';;
- : char = 'C'
```

### Cadenas (string): Representan secuencias de caracteres

```ocaml
# "Hello, world!";;
- : string = "Hello, world!
```

`OJO: '' -> char y "" -> string`

## Operaciones con **Tipos Primitivos**:

OCaml tiene signos diferentes la suma y el producto, según el tipo.

### Suma (+), Resta (-), Producto (*) y División (/) de int:

```ocaml
# 3 + 3;;
- : int = 6
# 3 - 3;;
- : int = 0
# 10 * 6;;
- : int = 60
# 20 / 6;;
- : int = 3
```

### Suma (+.), Resta (-.), Producto (*-), División (/.) y exponenciación(**) de floats:

```ocaml
# 3.3 +. 6.8;;
- : float = 10.1
# 4.7 -.  6.9;;
- : float = -2.2
# 4.7 *. 6.9;;
- : float = 32.43
# 4.7 /.  6.9;;
- : float = 0.6811594202898551
# 4.5 ** 5.;;
- : float = 1845.28125
```

### Concatenar (^) strings:

```ocaml
# "Hola" ^ " y adiós";;
- : string = "Hola y adiós"
```

## Conversiones de tipo: 

En OCalm `no hay conversiones automáticas de tipos`, a diferecnia de otros lenguajes como **C**. De ahí el tipado fuerte. Ejemplo:

```ocaml
# 4 + 16.3;;
Error: This expression has type float but an expression was expected of type
         int
```

La unica de forma de poder sumar un int y un float es haciendo una `conversión de tipos`, por ejemplo con la función float_of_int:

```ocaml
float_of_int 4 +. 16.3;;
- : float = 20.3
```

### Otras funciones de conversión de tipos son:

```ocaml
# int_of_float 4.4;;
- : int = 4
# string_of_int 42;;
- : string = "42"
# int_of_string "42";;
- : int = 42
# string_of_float 3.14;;
- : string = "3.14"
# float_of_string "3.14";;
- : float = 3.14
# char_of_int 97;;
- : char = 'a'
# int_of_char 'a';;
- : int = 97
# bool_of_string "true";;
- : bool = true
# string_of_bool true;;
- : string = "true"
```

## El tipo **unit**:

Solo hay un valor de tipo unit.

```ocaml
# ();;
- : unit = ()
```

## Funciones en Ocaml

Como se le pasa un argumento a un operación en Ocaml:

función argumento

Nota: para pasar un árgumento negativo, por ejemplo de tipo int es necesario poner (-3).

```ocaml
#  2. *. asin 1.0;;
- : float = 3.14159265358979312
```

asin es un valor float -> float (e float a float) es decir una funcion que toma un valor float y devuelve otro valor float. Como vemos las funciones son siempre de un tipo a otro:

```
# asin;;
- : float -> float = <fun>
```
Es como vimos anteriormenter las funciones para [convertir los tipos de datos](#conversiones-de-tipo), char_of_int, que es del tipo *int to char*.

```ocaml
# char_of_int;;
- : int -> char = <fun>
```

Que pasa si le pasamos un argumento no válido:

```ocaml
# char_of_int 300;;
Exception: Invalid_argument "char_of_int".
```

Nos dar un error de ejecución, 300 no tiene equivalencia en la tabla ASCII (256 characteres).

Como vemos en Ocaml, las funciones son también `tipos de datos`. De hecho char_of_int es un nombre de un tipo de valor, *int to char*.

En Ocaml, `hay tipos infinitos`.

### La operación de funciones tiene prioridad

```ocaml
# asin 1.0 /. 2.0 = (asin 1.0) /. 2.0;;
- : bool = true
```

No hace falta escribir paréntesis.

### ¿Y que pasa con las funciones que "no devuelven nada"?

Por ejempplo, print_endline.

```ocaml
# print_endline "Hola Mundo";; (* El Hola Mundo de OCaml *)
Hola Mundo
- : unit = ()
```

Vemos que devuelve un unit.

```ocaml
# print_endline;; 
- : string -> unit = <fun>
```

Es del tipo *string to unit*.

Entonces **print_endline** es un nombre de un tipo de dato, *string to unit*.

#### ¿Por qué devuelve unit?

Lo que importa de esta función no es valor, es que cuando se aplica la función a un string tiene un efecto coolateral que es mandar el string a la salida estandar. Es decir imprimir por pantalla.

## Funciones lamda

Hasta ahora hemos visto funciones predefinidas en el lenguaje.

Ahora vamos a ver como definir nuestras propias funciones, por ejemplo la función NOT:

```ocaml
# function true -> false | false -> true;;
- : bool -> bool = <fun>
```

`FUNTION` es una palabra reservada en OCmal.

`|` separa 2 reglas. 

izq -> der, a estás expresiones se les llama funciones `lamda`, también conocidas como funciones anónimas.

La programación **funcional** se basa en el [lambda-cálculo](https://es.wikipedia.org/wiki/C%C3%A1lculo_lambda), un formalismo matemático introducido por Alonzo Church en la década de 1930. El lambda-cálculo proporciona un marco teórico para definir y trabajar con funciones y sus aplicaciones. Es el fundamento teórico de muchos lenguajes de programación funcionales como Haskell, `OCaml`, Lisp, y otros.

A diferencia de la imperactiva que se basa en la [máquina de Turing](https://es.wikipedia.org/wiki/M%C3%A1quina_de_Turing).

### ¿Cómo la aplicamos?

```ocaml
# (function true -> false | false -> true) (1 < 2);;
- : bool = false
```

### ¿Cómo se evalua?

1. Se evalua `(1 < 2)`, que es `true`.

2. Se miran las `reglas de la función lamda`, la que coincida, en este caso `true -> false`.

3. Nos devuelve `false`.

### Otro ejemplo:

```ocaml
# function x -> 2 * x;;
- : int -> int = <fun>
```
Aquí x representa el valor de un posible argumento que le entre a la función. Es una función de *int -> int*.

```ocaml
# (function x -> 2 * x) (2 + 3) + 1;;
- : int = 11
```
Como se evalua:
    
1. (function x -> 2 * x) (2 + 3) + 1;; 

2. (function x -> 2 * x) 5 + 1;;

3. 10 + 1;;

4. int 11;;

Nota: Si tenemos varias reglas, el orden importa, cuando varias hacen *math* se utiliza la primera.

## Definiciones en OCaml

Asocia un nombre con un valor. Se comienza con let:

```ocaml
let nombre = cualquier_expresión_valida_en_ocaml
````

Por ejemplo:

```ocaml
# let pi = 2. *. asin 1.;;
val pi : float = 3.14159265358979312
```
Si ahora llamamos a pi, en el compilador interactivo:
```ocmal
# pi;;
- : float = 3.14159265358979312
```

ESTO `NO ES UNA VARIABLE` , no existe en concento de variable para referirse a los nombre de *cosas* en `Programación Funcional`. 

De hecho si volvemos a definir pi:
```ocaml
# let pi = 10;;
val pi : int = 10
# pi;;
- : int = 10
```

Acabamos de "machacar" el valor de pi, además que ahora es un *int*, cuando ti era un *float*. Y como sabemos no existe la [conversión de tipos](#conversiones-de-tipo) automática en OCaml.

OCaml guarda la definición más reciente.

### Redefiniciones

Se puede redefinir en nombre de un valor ya existente, ejemplo:
```ocaml
# let arcsen = asin;;
val arcsen : float -> float = <fun>
# arcsen;;
- : float -> float = <fun>
# asin;;
- : float -> float = <fun>
```

### Definiciones por un momento
En OCaml, puedes crear definiciones locales usando la expresión let ... in. Esto permite definir una variable o una función que es válida solo dentro de un cierto ámbito.

```ocaml
# let x = 2 + 1 in x * x;;
- : int = 9
```

#### ¿Cómo se evalua?

1. Evaluar la Definición Local:
    ```ocaml    
    let x = 2 + 1 in x * x
    (* Primero, se evalúa la expresión 2 + 1, que resulta en 3. *)
    ````
2. Sustituir y Evaluar:
    
    Luego, x se sustituye por 3 en la expresión x * x.
    
    Esto da como resultado 3 * 3.

3. Calcular el Resultado:

    Finalmente, 3 * 3 se evalúa como 9.

Como veis x solo existe localmente:

```ocaml
# let x = 2 + 1 in x * x;;
- : int = 9
# x;;
Error: Unbound value x
```

## Evaluación de expresiones

OCaml utiliza una evaluación estricta (`eager`). Esto significa que las expresiones se evalúan completamente antes de ser pasadas como argumentos a funciones o asignadas a nombres. 

Este enfoque garantiza que todas las operaciones se realicen de manera predecible y ordenada en el flujo del programa.

### Comparación con Lazy

A diferencia de la evaluación perezosa utilizada en algunos lenguajes funcionales como **Haskell**, donde las expresiones se evalúan solo cuando su valor es necesario, OCaml evalúa todas las expresiones inmediatamente.

La evaluación eager de OCaml facilita el control sobre el flujo de ejecución y permite optimizaciones más predecibles en términos de rendimiento y uso de memoria.

Nota:  Ocaml libera memoria automaticamente, a diferecnia de C.

## Librerias en OCaml

```ocaml
Char.code;; 
```
¿Qué pasa? ¿No deberia empezar por minúscula?

El nombre ahí es code, y el Char es un módulo, dentro de ese módulo hay un definición para el nombre code.

### Estructura:
    
    1. Core --- Stdlib

    2. Standar --- Char
	           --- String
	           --- List
               --- Etc.

No siempre es necesario especificar el módulo, por que las que estan en Stdlib el compilador las detecta automaticamente.

Para el resto Modulo.Nombre.

Como se carga un módulo nuestro:
```ocmal
#load "modulo.cmo";;
```
Si no queremos poner Modulo.nombre puedo hacer:

```ocaml
open Modulo;;
```
Ejemplo:

```ocaml
# open Char;;
# code;;
- : char -> int = <fun>
```

## Funciones de funciones

Como en matemáticas, en OCaml y en programación funcional una función puede recibir solo un argumento.

 Sin embargo, también existen técnicas para trabajar con funciones que simulan múltiples parámetros utilizando funciones anidadas o funciones de funciones. Ejemplo:

```ocaml
# let s = function n -> function i -> n + i;;
val s : int -> int -> int = <fun>
# s 1;;
- : int -> int = <fun>
# s 1 2;;
- : int = 3
```

### Esto se puede abreviar:

Pasar la regla a la izq.

```ocaml
# let s x = function y -> x + y;;
val s : int -> int -> int = <fun>
# let s x y = x + y;;
val s : int -> int -> int = <fun>
# s 1 2;;   (* Vemos que es la misma función *)
- : int = 3
```

Otro ejemplo, la [exponenciación](#suma--resta---producto---división--y-exponenciación-de-floats) es una función de funciones:

```ocaml
( ** );;
- : float -> float -> float = <fun>
```

## Operadores Lógicos:

1. Operador `=`:
    Se utiliza para comparar si dos valores son iguales entre si, el `==` de C.

    ```ocaml
    # ( = );;
    - : 'a -> 'a -> bool = <fun>
    # 1 = 2 ;;
    - : bool = false
    # 2 = 2 ;;
    - : bool = true
    ```

    `OJO`: En OCaml `==` NO se comparan valores, `hace otra cosa`, aunque aveces parece que si compara.

2. Operador `<>`:
    
    Se utiliza para comparar si dos valores son diferentes entre si, el `!=` de C.

    ```ocaml
    # ( <> );;
    - : 'a -> 'a -> bool = <fun>
    # 1 <> 2;;
    - : bool = true
    # 2 <> 2;;
    - : bool = false
    ```

3. Operador `not`:

    Es la necación lógica.

    ```ocaml
    # ( not );;
    - : bool -> bool = <fun>
    # not true;;
    - : bool = false
    # not false;;
    - : bool = true
    ```
    
4. Operador `||`:

    Es la disyunción lógica.

    ```ocaml
    # ( || );;
    - : bool -> bool -> bool = <fun>
    # true || true;;
    - : bool = true
    # false || true;;
    - : bool = true
    ```

5. Operador `&&`:

    Es la conjunción lógica.

    ```ocaml
    # ( && );;
    - : bool -> bool -> bool = <fun>
    # true && true;;
    - : bool = true
    # false && true;;
    - : bool = false
    ```

    Se puede manejar como una función, pero no se comporta como una función el OCaml.

    ```ocaml
    # (&&) false (1 / 0 > 0);;
    - : bool = false
    ```

    Debería dar error al dividir entre 0, por que en Ocaml en las funciones primero de evalua el argumneto, por ser ocaml un lenguaje [`eager`](#evaluación-en-ocaml).

    Sin embargo con otro operador:

    ```ocaml
    # ( * ) 0 (1/0);;
    Exception: Division_by_zero.
    ```
    ### ¿Que pasa con `&&`?
    
    b1 && b2, se evalua b1 y si es true se evalua b2, pero si b1 es false ya no se evalua b2.

    Es una manera de hacer una conjunción con atajo.

    Es una manera diferente de evaluar las funciones en ocaml.
    
    Nota: Con `||` pasa algo parecido, pero con true.

    Esto es por que `&&` no es como una función es como un:

    ```ocaml
    if <b1> then <b2> else false;;
    ```

## if-then-else

Estamos acostumbrado al if-then-else de otros lenguajes, pero es lo mismo que usar directamente los operadores lógicos, de hecho en ocasiones es más natural && y ||.

```ocaml
if condicion then
  expresion_si_cierto
else
  expresion_si_falso
```

## Tuplas de datos o pares

Las tuplas son una estructura de datos que permite agrupar varios valores de diferentes tipos en una única entidad. La sintaxis para definir una tupla es simplemente enumerar los valores separados por comas y encerrarlos entre paréntesis. 

El producto cartesiano en Ocaml está definido por defecto.

```ocaml
# 2,3;;
- : int * int = (2, 3)
# 2,3.3;;
- : int * float = (2, 3.3)
# 2,"Hola";;
- : int * string = (2, "Hola")
# true,"Hola";;
- : bool * string = (true, "Hola")
```

¿Qué es int * int? Un par. El producto cartesiano.

### Se puede definir funcionnes que reciban una tupla o par de valores:

```ocaml
# let f (x,y) = 2 * x + y;; (* Abreviado *)
val f : int * int -> int = <fun>
# let f = function (x,y) -> 2 * x + y;; (* Sin abreviar *)
val f : int * int -> int = <fun>
# f (2,4);;
- : int = 8
```

Otro ejemplo:

```ocaml
val s' : int * int -> int = <fun>
# s' (2,3);;
- : int = 5
```

### Las funciones fst y snd:

```ocaml
# fst;;  (* Al aplicarla a un par, nos devuelve la primera componente *)
- : 'a * 'b -> 'a = <fun>
# fst("hola", 2);;
- : string = "hola"
```

```ocaml
# snd;;  (* Al aplicarla a un par. nos devuelve la segunda componente *)
- : 'a * 'b -> 'b = <fun>
# snd("hola", 2);;
- : int = 2
```

### Definir fst y snd:

En OCaml se pueden definir super fácil estás funciones.

#### fst:

```ocaml
# let fst (x,y) = x;;
val fst : 'a * 'b -> 'a = <fun>
```
O como la y no se usa, se puede usar el simblo `_`.

```ocaml
# let fst (x,_) = x;;
val fst : 'a * 'b -> 'a = <fun>
# fst (10,5);;
- : int = 10
```
#### En el caso de snd: 

```ocaml
# let snd (_,y) = y;;
val snd : 'a * 'b -> 'b = <fun>
# snd (10,5);;
- : int = 5
```

Estás funciones no son muy usadas, dado que como vemos las podemos remplazar por el patrón con el que las hemos definido y además es mucho más elegante.

### Trios, etc.

Recordemos que los tipos de datos en OCaml son `INFINITOS`, por lo tanto:

```ocaml
# (1, 2, 4);;
- : int * int * int = (1, 2, 4)
# (1, "hola", true);;
- : int * string * bool = (1, "hola", true)
# (1, "hola", true, 'C', 4.5);;
- : int * string * bool * char * float = (1, "hola", true, 'C', 4.5)
```

Obsiamente no puedo hacer fst a un trio:
```ocaml
# fst (2,3,4);;
Error: This expression has type 'a * 'b * 'c
       but an expression was expected of type 'd * 'e
```
Dado que fst espera un ('a * 'b), un par de datos, sea cual sea.
Siendo a un tipo de dato y b otro, que no tienen que ser iguales.
Para devolver el primer tipo de dato, 'a. Recordemos:
```ocaml
# fst;;
- : 'a * 'b -> 'a = <fun>
```

### Otro uso de los pares

Para implementar operaciones que devuelven varios resultados necesitamos el producto cartesiano. Ejemplo:

```ocaml
# let sp n m = n + m, n * m
  ;;
val sp : int -> int -> int * int = <fun>
# sp 1 2;;
- : int * int = (3, 2)
```

Otro ejemplo:

La función per_area calcula el perímetro y la área de un círculo, devolviendolos en un par. 
```ocaml
# let per_area r =  (*r es el Radio de un círculo *)
  let pi = 2. *. asin 1. in
  (2. *. pi *. r,    (* Perímetro de un círculo, 2π * r * r *)
  pi *. r *. r)      (* Área de un cículo, π * r * r *)
  ;;
val per_area : float -> float * float = <fun>
# per_area 4.;;
- : float * float = (25.1327412287183449, 50.2654824574366899)
```

Una pequeña optimización es definir pi con anterioridad, para que no se evalue 2 veces:

```ocaml
# let per_area =
    let pi = 2. *. asin 1. in
    function r ->
      2. *. pi *. r,
      pi *. r *. r
  ;;
val per_area : float -> float * float = <fun>
```
Ahora pi solo se calcula una vez, a diferencia de las función anterior.

## La Recursividad

La recursividad es una técnica en programación y matemáticas donde una función se llama a sí misma para resolver un problema.

Se utiliza para dividir un problema complejo en subproblemas más simples del mismo tipo, lo que permite resolver problemas de manera más estructurada y fácil de entender.

Componentes Clave de la Recursividad

1. `Caso Base`: Es la condición que termina la recursión. Sin un caso base, la función se llamaría a sí misma indefinidamente. (Bucle infinito)

2. `Caso Recursivo`: Es la parte de la función que divide el problema en subproblemas más pequeños y se llama a sí misma para resolver esos subproblemas.

Ejemplo clásico em pseudocódigo

```c
// Sucesión de Fibonacci
fib n =                                // n >= 0
    si n <= 1 devolver n               // Caso base
    si no fib (n - 1) + fib (n - 2);;  // Caso recursivo
```

### Recursividad NO terminal

```ocaml
# (* El cociente de la división antera *)
  let rec quo x y = (* Solo tiene sentido si: x >= 0, y > 0 *)
    if x < y then 0
    else 1 + quo (x - y) y
  ;;
val quo : int -> int -> int = <fun>
```
Aqui va creciendo, es se llama recursividad no terminal, no tail recursion.

#### ¿Por qué crece?

En el caso: 
```ocaml 
else 1 + quo (x - y) y 
```
Cuando hacemos la llamada recursiva, ```quo (x - y) y```, nos queda `pendiente` sumarle 1, EN CADA LLAMADA, esas operaciones pendientes se va a acumular en la pila.

### Recursividad Terminal

```ocaml
# (* El resto de la división entera *)
  let rec rem x y = (* Solo tiene sentido si: x >= 0, y > 0 *)
      if x < y then x
      else rem (x - y) y
  ;;
val rem : int -> int -> int = <fun>
```
Aqui no crece, esto se llama reculsividad final o terminal, tail recursion.

#### ¿Por qué NO crece?

Como vemos en:
```ocaml
else rem (x - y) y
```

La llamada recursiva es la última operación, non vamos dejar operaciones en la pila.


Esta última recursividad es mucho más eficiente. No existe espacio infinito para guardar la reculsividad, normalmente el espacio lo gestiona el sistema operativo o la máquina virtual de Ocaml, se llama pila de reculsividad, si se llena da ERROR de stack overflow.

Una expresión reculsiva terminal nunca va a agotar la pila de reculsividad.

Debería ser muy fácil determinal si es terminal o no, si lo estamos entendiendo.

### Complejidad computacional

Ahora vamos a juntar los 2 ejemplos anteriores:

```ocaml
# (* Ahora la división con cociente y resto *)
  let div x y = quo x y, rem x y
  ;;
val div : int -> int -> int * int = <fun> 
```
Nota: Devuelve un [par](#tuplas-de-datos-o-pares).

Si analizamos esto, hacemos "2 veces el reparto", lo cual desde el punto de vista computacional no tiene sentido.

Vamo a redefinir la función:

```ocaml
# (* División con cociente y resto *) 
  let rec div1 x y =
    if x < y  then (0,x) (* Paso no reculsivo *)
    else 1 + fst (div (x-y) y), snd (div (x-y) y)
  ;;
val div : int -> int -> int * int = <fun>
```

#### ¿Está mejor?

Pareque si que, pero no hemos reduccido el número de pasos al contrario 2^n pasos. Tarda muchísimo.

El error es calcular lo mismo 2 veces, lo cual de vuelta desde el punto de vista computacional no tiene sentido.

Ahora:

```ocaml
# (* División con cociente y resto *)
  let rec div2 x y =
    if x < y  then (0,x) (* Paso no recursivo *)
    else let (q,r) = div (x - y) y in
      1 + q, r
  ;;
val div : int -> int -> int * int = <fun>
```

Y sin usar fst y snd, como se comentaba con [anterioridad](#en-el-caso-de-snd), no son muy usandas, dado que es más elegante y incluso visual hacerlo con el patrón.

#### Comparación de [tiempos](#medir-tiempos-de-ejecución):

```ocaml
# crono2 div1 200000 2;;
- : float = 0.0117689999999868178
# crono2 div2 200000 2;;
- : float = 0.0040679999999895244
```

Podemos ver una mejora considarable de los tiempos de ejecución.

### Fibonacci, análisis:

La versión que vimos en [pseudocódigo](#la-recursividad) hace nada en Ocaml sería:

```ocaml
# (* Sucesión de Fibonacci *)
  let rec fib n = (* n >= 0 *)
      if n <= 1 then n
      else fib (n - 1) + fib (n - 2)
  ;;
val fib : int -> int = <fun>
```

Esta implementación recursiva simple de la sucesión de Fibonacci es ineficiente para valores n grande debido a la gran cantidad de llamadas repetidas a la función. Cada cálculo de fib(n) llama a fib(n-1) y fib(n-2), lo que resulta en una explosión exponencial en el número de llamadas recursivas. 

El árbol de llamadas para `fib 4` sería:

```scss
fib(4)
├── fib(3)
│   ├── fib(2)
│   │   ├── fib(1)
│   │   └── fib(0)
│   └── fib(1)
└── fib(2)
    ├── fib(1)
    └── fib(0)
```

```ocaml
# crono fib 20;;  (* Comparativa de tiempos *)
- : float = 0.000330000000000000432
# crono fib 40;;
- : float = 3.320817
```
#### ¿Como optimizar está función?

Podría hacer una función que para cada fic me devuelve los 2 últimos fic en lugar de solo 1.

```ocaml
# (* Sucesión de Fibonacci *)
  let rec fib2 = function
    1 -> (1, 0)
    | n -> let f1, f2 = fib2 (n - 1) in
      (f1 + f2, f1)
  ;;
val fib2 : int -> int * int = <fun>
# (* Para que no me devuelva un par *)
  let fib x = fst (fib2 x)
  ;;
val fib : int -> int = <fun>
```
Ahora los tiempos:

```ocaml
# crono fib 20;;
- : float = 3.0000000004193339e-06
# crono fib 40;;
- : float = 3.0000000004193339e-06
# crono fib 80;;
- : float = 2.99999999997524469e-06
```

En la otra versión fib 80 lo acabaríamos abortando del tiempo que llevaba.

#### ¿Es recursiba terminal fib2?

No, dado que la última operación que hace no es la llamada recursiva, lo cual en este caso no importa, dado que con fib de 90 nos pasamos de [max_int](#límites-de-precisión-ocaml).

### Hacer una función recursiva terminal

Cuando una recursivida no es termnial, puede dar el error de `stack overflow`. Esto el debido a que cada llamada de la función deja en la pila las operaciones pendientes.

Pero si la recursivad es terminal (tail reculsion) nunca va a dar `stack overflow`.

Hacer una funciín recursiva termnial es como si lo hiciera con un bucle, los buckes se traducen en funciones reculsivas terminales.

Vamos a hacer fib recursivo termnial:

```ocaml
# (* Sucesión de Fibonacci, tail recursion *)
  let fib' n =
    let rec aux (i, f, a) =
      if i = n then f               (* Caso base*)
      else aux (i + 1, f + a, f)    (* Caso recursivo *)
    in aux (0, 0, 1)
  ;;
val fib' : int -> int = <fun>
```

Ahora la última operación es la llamada recursiva  `else aux (i + 1, f + a, f)`, por lo tanto `nunca` vamos a temer `stack overflow` por muchas llamadas que haga la función.

## Listas

Para cada valor de tipo `t`, tenemos tambien `t list`.

¿Qué es un t list? Es una secuencias o listas finitas de valores de tipo t.

### ¿Cómo es una lista en OCaml?

```ocaml
# [1;2;3];;                                     (* Lista de int *)
- : int list = [1; 2; 3]
# ['a';'b';'c'];;                               (* Lista de char *)
- : char list = ['a'; 'b'; 'c']
# [1.2;1.4;6.];;                                (* Lista de float *)
- : float list = [1.2; 1.4; 6.]
# ["Hola";" ";"Mundo!"];;                       (* Lista de string *)
- : string list = ["Hola"; " "; "Mundo!"]
# [1,4;4,5];;                                   (* Lista de pares de int *)
- : (int * int) list = [(1, 4); (4, 5)]
# [1, 'A'; 2, 'B'];;                            (* Lista de pares, un int y un char *)
- : (int * char) list = [(1, 'A'); (2, 'B')]
# [];;                                          (* Lista vacía *)
- : 'a list = []
```

Nota: La lista vacía `[]`, es super importante para hacer `casos base` en funciones que manejen listas. Además las listas tienen `naturaleza recursiva`, es decir, una lista o es lista vacia o tiene una cabeza y una cola.

### Funciones para manejar listas

Algunas funciones predefinidas para trabajar con listas en el módulo List.

#### ¿Como descompongo un t list para trabajar con sus componentes?

```ocaml
# List.hd;;
- : 'a list -> 'a = <fun>
```

Devuelve la cabeza de la lista (head), es decir el primer elemento.

```ocaml
# List.tl;;
- : 'a list -> 'a list = <fun>
```

Devuelve una lista igual a la original pero sin la cabeza. La cola (tail).

Con estas 2 funciones en OCaml se pueden hacer funciones para hacer lo que queramos con una lista.

`Nota`: Una lista en `OCaml no es como las listas en C`, el tipado de ocaml es fijo, los valores son inmutables, no puedes `insertar` valores en listas.

### Operadores de las listas:

```ocaml
# (@);;
- : 'a list -> 'a list -> 'a list = <fun>
# let l = [1,2];;                    (* Nombramos l, como una lista para de enteros *)
val l : (int * int) list = [(1, 2)]
# l @ l;;
- : (int * int) list = [(1, 2); (1, 2)]
# l @ [1,3];;
- : (int * int) list = [(1, 2); (1, 3)]
```

Como vemos el operador @ nos devuelve una lista concatenada con otra.

Es equivalente a usar la función `List.append`:

```ocaml
# List.append l [1,3];;
- : (int * int) list = [(1, 2); (1, 3)]
```

### Contrucción de funciones para manejar listas

Definir length, nos devuelve en número de elemenos de una lista, su longitud, será del tipo 'a list -> int.

```ocaml
# let rec length l = 
    if l = [] then 0 (* Caso base *)
    else 1 + length (List.tl l) (* La llamada recursiva *)
  ;;
val length : 'a list -> int = <fun>
```

Last, nos devuelve el último elemento de una lista, del tipo 'a list -> 'a.

```ocaml
# let rec last l =
    if List.tl l = [] then List.hd l
    else last (List.tl l)
  ;;
val last : 'a list -> 'a = <fun>
```

#### La función lenght, en lugar de usar `if-then-else`, se puede construir con [Pattern Matching](#el-pattern-matching):

```ocaml
# let rec length l = 
    match l with
    | [] -> 0 (* Caso base *)
    | _  -> 1 + length (List.tl l) (* La llamada recursiva *)
  ;;
val length : 'a list -> int = <fun>
```

Una función para comparar la longitud de 2 listas, como vemos se puede usar una función anónima con [Pattern Matching](#el-pattern-matching):

```ocaml
# let rec compare_lengths l1 l2 =
  (function
      [], [] -> 0
    | [], _  -> -1
    |  _, [] -> 1
    | _::t1, _::t2 -> compare_lengths t1 t2) (l1, l2)
  ;;
val compare_lengths : 'a list -> 'b list -> int = <fun>
```

Podemos definir el append que tenemos en el módulo list a partir del [Pattern Matching](#el-pattern-matching):

```ocaml
# let rec append l1 l2 = match l1 with 
    [] -> l2                      (* Si l1 es vacia *)
  | h::t -> h :: append t l2      (* Si no es vacia *)
  ;;
val append : 'a list -> 'a list -> 'a list = <fun>
```

Como vemos el append, que está así definido en el módulo List de OCaml, no es [recursivo terminal](#recursividad-terminal), tenemos el List.rev_append que si lo es. Vamos a definirlo:

```ocaml
# let rec rev_append l1 l2 = match l1 with
      [] -> l2
    | h::t -> rev_append t (h::l2)
  ;;
val rev_append : 'a list -> 'a list -> 'a list = <fun>
```

COmo vemos es una función reculsiva terminal, es más natural el rev_append que el append por como está construidas las listas en Ocaml.

Podemos definir List.rev a partir del rev_append, dado que es un caso particular.

```ocaml
# let rev l = rev_append l []
  ;;
val rev : 'a list -> 'a list = <fun>
```

Ahora podríamos hacer un append recursivo terminal:

```ocaml
# let append' l1 l2 = rev_append (rev l1) l2
  ;;
val append' : 'a list -> 'a list -> 'a list = <fun>
```

#### Como curiosidad:

A partir de la versión 5 de Ocaml la append es terminal, en las anterior no lo era por lo lentas que eran las máquinas en su momento.

La no terminalidad de append tiene una particularidad, lo que deja pendiente es el contructor, son terminales salvo por el contructor es constructor no es una "operación" como tal, si al compilador se lo pides puede compilar función así como terminal. Que es lo que han hecho en la versión 5 de ocaml.

## Los errores de ejecución

Un error de ejecución en OCaml es un error que ocurre mientras el programa está siendo ejecutado, en contraste con los errores de compilación, que se detectan antes de que el programa sea ejecutado. Algunos ejemplos:

```ocaml
# 5 / 0;;
Exception: Division_by_zero.
```

```ocaml
# List.hd [];;
Exception: Failure "hd".
```

No puede devolver la cabeza de una lista vacia.

```ocaml
# List.tl [];;
Exception: Failure "tl".
```

Pasa lo mismo con la cola.

`List.nth`nos devuelve el elemento de la posición que le pidamos de una lista, que pasa si la aplicamos a un elemento que no existe:

```ocaml
# List.nth;;
- : 'a list -> int -> 'a = <fun>
# List.nth [5; 4] 1;;  (* Pedimos la posición 1 de la lista *)
- : int = 4
# List.nth [5; 4] 3;;  (* Pedimos la posición 3 de la lista *)
Exception: Failure "nth".
```

Error de ejecución. Y si accedemos a uno que no tiene sentido:

```ocaml
# List.nth [5; 4] (-1);;
Exception: Invalid_argument "List.nth".
```

Error de ejecución, pero distinto.

### ¿Qué es esto de `Exception`?

```ocaml
# Division_by_zero;;
- : exn = Division_by_zero
```

Un nuevo tipo de dato, `exn`.

```ocaml
# Failure;;
Error: The constructor Failure expects 1 argument(s),
       but is applied here to 0 argument(s)
```

¿Cómo que un constructor?

Entonces:

```ocaml
# Failure "menudo error!";;
- : exn = Failure "menudo error!"
```

### ¿Cómo hacemos para que nuestras funciones también den errores de ejecución?

Vamos a definir hd:

```ocaml
# let hd = function h::_ -> h;;
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]
val hd : 'a list -> 'a = <fun>
```

Nos da una abvertencia de match, dado que me he dajado la lista vacía.

```ocaml
# hd [];;
Exception: Match_failure ("//toplevel//", 1, 9).
```

¿Y como hacemos ese error, como en la función del módulo List?

La función `raise`:

```ocaml
# raise;;
- : exn -> 'a = <fun>
```

Es una función de un error a cualquier cosa, que quiere decir, que nunca devuelve nada.

```ocaml
# raise Division_by_zero;;
Exception: Division_by_zero.
```

No devuleve nada si no que imprime el error y termina la ejecución.

Ahora que sabemos todo esto, vamos a hacerlo bien:

```ocaml
# let hd = function 
      [] -> raise (Failure "hd")      
     | h::_ -> h
  ;;
val hd : 'a list -> 'a = <fun>
# hd [];;
Exception: Failure "hd"
```

## Los valores del tipo 'a option:

Al igual que para cada tipo 'a hay un 'a list, también para cada tipo de datos 'a existe 'a option.

Son muy útiles para manegar errores y no detener la ejecución del código.

Tienen 2 constructores Nome y Some.

```ocaml
# None;;
- : 'a option = None
# Some 5;;
- : int option = Some 5
```

Nota: Los contructores en Ocaml `SIEMPRE` empiezan por mayúscula, como vimos en los [errores](#los-errores-de-ejecución). El contuctor de los tipos exn `Failure` y ahora `Some` y `None`.

Un ejemplo:

`List.find` da error si no encuntra y `List.fin_opt` da None al fallar y un int option al estar bien.

Vamos a definir un par de valores para trabajar
```ocaml
# let par = fun x -> x mod 2 = 0;;
val par : int -> bool = <fun>
# let l = [1;3;3;5];;
val l1 : int list = [1; 3; 3; 5]
# let l2 = [1;2;3;5];;
val l2 : int list = [1; 2; 3; 5]
```

Bien, ahora vamos a definar un función que imprima si es par:

Sin usar int option

```ocaml
# let print_first_even l =
        print_endline (string_of_int (List.find par l));;
val print_first_even : int list -> unit = <fun>
# print_first_even l1;;
Exception: Not_found.
# print_first_even l2;;
2
- : unit = ()
```
Como vemos cuando no encuntra un par, dun error de ejecución, lo cual nos pararía el programa. Pero si usamos `List.fin_opt` no va a petar, en algún caso nos puede interesar. Vamos usar `List.fin_opt`  y [pattern maching](#el-pattern-matching):

```ocaml
# let print_first_even l =
    match List.find_opt par l with
        None -> print_endline "Ningún par"
      | Some n -> print_endline (string_of_int n)
  ;;
val print_first_even : int list -> unit = <fun>
```

Como funciona:

``` ocaml
# print_first_even l1;;
Ningún par
- : unit = ()
# print_first_even l2;;
2
- : unit = ()
```

En está última implementación no se termina el programa.

## Interceptar errores

A parte de utilizar 'a opt para no parar la ejecución de un código tenemos otro mecanismo.

En esta función:

```ocaml
let queens n =
  let rec completar path i j =
    if i > n then Some path   (* Hemos terminado *)
    else if j > n then None   (* No se puede completar *)
    else if compatible (i,j) path
      then match completar path ((i,j)::path) (i+1) 1 with
          None -> completar path i (j+1)
        | Some sol -> Some sol
    else completar oath i (j+1)
    in completar [] 1 1;;
```

En lugar de `Some` y `None`, se puede utilizar `try ____ with`:

```ocaml
let queens n =
  let rec completar path i j =
    if i > n then path                   (* Hemos terminado *)
    else if j > n then raise Not_found   (* No se puede completar *)
    else if compatible (i,j) path 
      then try completar ((i,j)::path) (i+1) 1 with
        | Not_found -> completar path i (j+1)
    else completar path i (j+1)
  in completar [] 1 1;;
(* try ____ with, se evalua lo que hay en la mitad, si da fallo hace lo que le digamos*)
```

Como es una try with en general:

```ocaml
try <e> with 
    <p1> -> <e1>
  | <p2> -> <e2>
  | ...
```

Si `<e>` no da fallo no pasa nada, si lo da, hace patern maching con lo que tiene a continuación. Y el error de interceptaria en lugar de detenerse el código.

## Definir tipos de datos

Para definir un tipo de datos en Ocaml se empieza por la palabra reservada type.

Por ejemplo:

```ocaml
type numero = I of int | F of float;;
```
 
Hemos definido 2 contructores, I que nos convierte un int en un número y F que nos convierte un float en un número.

```ocaml
# I 4;;
- : numero = I 4
# F 2.4;;
- : numero = F 2.4
# [I 3; F 2.3; I 5];;
- : numero list = [I 3; F 2.3; I 5]
```

Con el tipo de dato `numero` y patern maching, podríamos hacer una funciones que diferenciaran los enteros: 

```ocmal
# let is_int = function  (* Es un entero? *)
      I _ -> true | _ -> false
  ;;
val is_int : numero -> bool = <fun>
# let rec first_int = function (* Devuelve el primer entero de una lista de números *)
      [] -> raise Not_found
    | I n :: _ -> n
    | _ :: t -> first_int t
  ;;
val first_int : numero list -> int = <fun>
```

### Vamos con más ejemplos:

`Otro int`:

```ocmal
# type otroint = Otro of int;;
type otroint = Otro of int
# Otro 1;;
- : otroint = Otro 1
# Otro 5;;
- : otroint = Otro 5
# Otro 7;;
- : otroint = Otro 7
# Otro 7.1;;
Error: This expression has type float but an expression was expected of type
         int
```

`dobleint`:

```ocaml
# type dobleint = R of int | L of int;;
type dobleint = R of int | L of int
# R 5;;
- : dobleint = R 5
# L 5;;
- : dobleint = L 5
# R 10;;
- : dobleint = R 10
# L 10;;
- : dobleint = L 10
# L 10 = R 10;;
- : bool = false
(* No son iguales dado que no están construidos con el mismo contructor *)
```

Si no existieran los int option, podría implementarlos:

```ocaml
# type intplus = Int of int | Na;;
type intplus = Int of int | Na
(* Int es un constructor varaible y Na constante *)
# Na;;
- : intplus = Na
# Int 4;;
- : intplus = Int 4
# Int 10;;
- : intplus = Int 10
```

Uso esta definición en el [anexo](#como-llamar-una-función-con-un-simbolo), como usar `<e1> / <e2>` en lugar de `func <e1> <e2>`.

Podría definir los booleanos:

```ocaml
# type boolean = True | False;;
type boolean = True | False
# let no = function
      True -> False
    | False -> True
  ;;
val no : boolean -> boolean = <fun>
(* Podriamos definirlo como en C *)
# let (!) = function
      True -> False
    | False -> True;;
val ( ! ) : boolean -> boolean = <fun>
# no True;;
- : boolean = False
# !True;;
- : boolean = False
```

Otro ejemplo:

```ocaml
# type palo = Diamante | Corazon | Trebol | Pica;;
type palo = Diamante | Corazon | Trebol | Pica
# let es_rojo = function
      Corazon | Diamante -> True
    | _ -> False
  ;;
val es_rojo : palo -> boolean = <fun>
# let es_negro p = ! (es_rojo p);; (* ! definida arriba *)
val es_negro : palo -> boolean = <fun>
```

Ejemplo de definición recursiva:

```ocaml
# type nat = One | Succ of nat;;  (* Es una definición reculsiva *)
type nat = One | Succ of nat
# One;;
- : nat = One
# Succ One;;
- : nat = Succ One
# Succ (Succ One);;
- : nat = Succ (Succ One)
# let rec nat_of_int = function
    n when n < 0->  raise (Invalid_argument "nat_of_int")
  | 1 -> One
  | n -> Succ (nat_of_int (n-1))
  ;;
val nat_of_int : int -> nat = <fun>
# nat_of_int (-1);;
Exception: Invalid_argument "nat_of_int".
# nat_of_int 0;;
Exception: Invalid_argument "nat_of_int".
# nat_of_int (10);;
- : nat = Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ One))))))))
```

Otro ejemplo con 3 constructores:

```ocaml
# type entero = Pos of nat | Neg of nat | Zero;;
type entero = Pos of nat | Neg of nat | Zer
# let absoluto = function
      Neg n -> Pos n
    | e -> e;;
val absoluto : entero -> entero = <fun>
# let opuesto = function
      Zero -> Zero
    | Pos n -> Neg n
    | Neg n -> Pos n;;
val opuesto : entero -> entero = <fun>
# let entero_of_int = function
      0 -> Zero
    | n -> if n > 0 then Pos (nat_of_int n)
           else Neg (nat_of_int (-n));;
val entero_of_int : int -> entero = <fun>
```

Ejemplo de definición polimórfica:

```ocaml
# type 'a option = None | Some of 'a;; (* Tipo polimórfico *)
type 'a option = None | Some of 'a
```
option no es un tipo, es un contructor de tipos.

Así están definidos en OCaml los 'a option.

Definir las listas:

```ocaml
# type 'a lista = Vacia | Cons of 'a * 'a lista;;
type 'a lista = Vacia | Cons of 'a * 'a lista
# Vacia;;
- : 'a lista = Vacia
# Cons (3, Vacia);;
- : int lista = Cons (3, Vacia)
# Cons (2,Vacia);;
- : int lista = Cons (2, Vacia)
# let l3 = Cons (3, Vacia);;
val l3 : int lista = Cons (3, Vacia)
# let l33 = Cons (3, l3);;
val l33 : int lista = Cons (3, Cons (3, Vacia))
```

## Árboles binarios

No vienen definidos en OCaml.

Las listas son arboles unarios, con solo una rama.

Definición:

```ocaml
# type 'a bintree =
      Empty 
    | Node of 'a * 'a bintree * 'a bintree;;
type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree
```

Algunas funciones:

```ocaml
let rec nnodos = function (* Número de nodos *)
    Empty -> 0
  | Node (_,i,d) -> 1 + nnodos i + nnodos d;;

let rec altura = function
    Empty -> 0
  | Node (_, i, d) -> 1 + max (altura i) (altura d);;
```

El la `práctica 9`, hay más ejemplos de árboles binarios.

## La parte imperactiva de OCaml

Hasta el momento solo usamos la parte funcional de OCaml, pero como es un lenguaje multiparadigma, tambien tiene el paradigma imperactivo, como C.

El operador `;` en OCaml se usa para ejecutar una expresión y luego ejecutar otra, ignorando el resultado de la primera. Esto es útil cuando tienes varias expresiones que deben ejecutarse en secuencia y solo te importa el resultado de la última.

Ejemplo:

```ocaml
# print_endline "Hola, mundo!"
  print_endline "Esto es OCaml!"
  ;;
Error: This function has type string -> unit
       It is applied to too many arguments; maybe you forgot a `;'.
```

Con `;`:

```ocaml
# print_endline "Hola, mundo!";
  print_endline "Esto es OCaml!"
  ;;
Hola, mundo!
Esto es OCaml!
- : unit = ()
```

Aquí, las dos expresiones de impresión se ejecutan secuencialmente. El ; indica que la primera expresión debe evaluarse (y su resultado se ignora), y luego se evalúa la segunda expresión.

### Variables

Como definir una 'variable', es decir un valor mutable:

```ocaml
# let x = ref 5;;
val x : int ref = {contents = 5}
# x := 6;;  (* Cambia el valor al que apunta x *)
- : unit = ()
# x;;
- : int ref = {contents = 6}
# !x;; (* !variable, para ver el valor *)
- : int = 6
```

### Switch

Los switch, se pueden hacer con el `match <e>` que vimos anteriormente.

### Los bucles

#### Bucle while:

```ocaml
while <b> do <e> done (* <b> bool *)
```
Cuando es false daria un `unit` y si no evalua `<e>`.

#### Bucle for:

```ocaml
for <i> = <i1> to <i2> (* Ascendente *)
  do <e> done

for <i> = <i1> down to <i2> (* Descendente *)
  do <e> done
```

Ejemplos con fact:

Funcional:

```ocaml
# let rec fact n =  (* Recursivo *)
    if n <= 0 then 1
    else n * fact (n-1);;
val fact : int -> int = <fun
```

```ocaml
# let fact n =  (* Recursivo terminal *)
    let rec aux (f,i) =
      if i <= n then
        aux (f * i, i + 1)
      else f
    in aux (1,1);;
val fact : int -> int = <fun>
```

Bucle while:

```ocaml
# let fact n = 
    let f = ref 1 in
    let i = ref 1 in 
    while !i <= n do
      f:= !f * !i;
      i := !i + 1
    done;
    !f;;
val fact : int -> int = <fun>
```

Bucle for:

```ocaml
# let fact n =
    let f = ref 1 in
    for i = 1 to n do
        f := !f * i
    done;
    !f;;
val fact : int -> int = <fun>
```

Como vemos los bucles son más parecidos a una función recursiva terminal.

### Los arrays

```ocaml
# let v = [|1; 10; 100|];;
val v : int array = [|1; 10; 100|]
```

Diferecias con las listas:

- Rendimiento, en a' array puedes acceder al elemento de cualquiera posición con coste constante, adiferencia de las listas.

- Los array está numerados, de 0 a (n-1).

- Tambien tenemos el módulo Array.

```ocaml
# Array.length;;
- : 'a array -> int = <fun>
# Array.get;;  (* Similar a nth pero co coste constante *)
- : 'a array -> int -> 'a = <fun>
```

Array.get se abrevia con `v.(1);;`

```ocaml
# v.(1);;
- : int = 10
# v.(2);;
- : int = 100
# v.(0);;
- : int = 1
# v.(3);;
Exception: Invalid_argument "index out of bounds".
```

Cambiar un valor del array:

```ocaml
# open Array;; (* Para dejar de poner Array.nombre *)
# set v 2 (v.(1) + 2* v.(2));;
- : unit = ()
# v;;
- : int array = [|1; 10; 210|]
```

Devuelve unit, pero no nos importa lo que devuelva, lo importante es que cambia v.

Set tambien se puede abreviar:

```ocaml
# v.(2) <- v.(1) + 2 * v.(2);; (* Set abreviado <- *)
- : unit = ()
# v;;
- : int array = [|1; 10; 430|]
```

Array.init y Array.make:

```ocaml
# Array.init 20 succ;;
- : int array =
[|1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20|]
# Array.make 10 'a';;
- : char array = [|'a'; 'a'; 'a'; 'a'; 'a'; 'a'; 'a'; 'a'; 'a'; 'a'|]
```

Al igual que List.init y List.make.

`Array.copy` hace una copia del array en ese momento.

## Registros de datos en OCaml

```ocaml
# type person = {name : string; age : int};;
type person = { name : string; age : int; }
```

person es un reguistro de datos, un struct en C.

Tiene 2 componentes un string y un int por lo tanto es un registro de 2 campos.

Se puede hacer patern maching en los registros:

```ocaml
let order p =
  {name = p.name; age = p.age + 1};;
```

```ocaml
# let older {name = n; age = a} =
    {name = n; age = a + 1};;
val older : person -> person = <fun>
```

### Puedo hacer otra definición de los registros:

```ocaml
# type person = {name : string; mutable age : int}
  ;;
type person = { name : string; mutable age : int; }
# let p2 : person = {name = "Marta"; age = 18}
  ;;
val p2 : person = {name = "Marta"; age = 18}
```

Cómo modifico el valor mutable? Y como lo veo?

```ocaml
# p2.age <- 28;; (* Cambio la edad *)
- : unit = ()
# p2;; (* Veo el contenido del struct *)
- : person = {name = "Marta"; age = 28}
```

Otro ejemplo:

```ocaml
# type 'a var = {mutable valor : 'a}
  ;;
type 'a var = { mutable valor : 'a; }
# {valor = 1}
  ;;
- : int var = {valor = 1}
# {valor = "Hola"}
  ;;
- : string var = {valor = "Hola"}
# let initvar x = {valor = x}
  ;;
val initvar : 'a -> 'a var = <fun>
# initvar 10
  ;;
- : int var = {valor = 10}
# initvar "Casa"
  ;;
- : string var = {valor = "Casa"}
# let (!!) v = v.valor
  ;;
val ( !! ) : 'a var -> 'a = <fun>
# let n = initvar 7
  ;;
val n : int var = {valor = 7}
# !!n
  ;;
- : int = 7
```

Acabo de implementar las variables en OCaml, de hecho así están implementadas.

## Un contador

Vamos a ver como podemos hacer un contador:

```ocaml
let n = ref 0   (* Variable global *)

let next () = 
  n := !n + 1;  (* Suma 1 a la variable *)
  !n            (* Muestra el valor *)

let reset () =  
  n := 0        (* Vuelve a 0 la variable *)
```

Ahora sin la variable global:

```ocaml
let next, reset =
  let n = ref 0 in                  (* Variable *)
  (function () -> n := !n + 1; !n), (* next *)
  (function () -> n := 0);;         (* reset *)
```

Ahora, una manera de hacer implementar esto comodamente es usar un módulo con el contador.

Todo este tiempo con ocamlc algo.ml -i algo.mli estabamos compilando módulos.

Para cargarlos en el compilador interactivo `#load "counter.cmo";;`, entre comillas la ruta.

¿Pero que pasa si queremos tener 2 contadores? ¿Tenemos que utilizar 2 módulos?

Aquí es donde cobran sentido los functores. 

¿Qué es un functor? Un functor es una función que devuelve un módulo.

Veamos un ejemplo en el compilador interactivo:

```ocaml
# module Contador () : sig
    val next : unit -> int
    val reset : unit -> unit
  end = struct
    let n = ref 0
    let next () = 
      n := !n + 1;
      !n
    let reset () =
      n := 0
  end
  ;;
module Contador :
  functor () -> sig val next : unit -> int val reset : unit -> unit end
```

Ahora podría tener varios contadores.

```ocaml
# module Contador0 = Contador ();;
module Contador0 : sig val next : unit -> int val reset : unit -> unit end
# module Contador1 = Contador ();;
module Contador1 : sig val next : unit -> int val reset : unit -> unit end
# module Contador2 = Contador ();;
module Contador2 : sig val next : unit -> int val reset : unit -> unit end
```

Como vemos tenemos 3 contadores:

```ocaml
# Contador1.next ();;
- : int = 1
# Contador2.next ();;
- : int = 1
# Contador0.next ();;
- : int = 1
# Contador0.next ();;
- : int = 2
# Contador0.reset ();;
- : unit = ()
# Contador0.next ();;
- : int = 1
# Contador1.next ();;
- : int = 2
``` 

En OCaml hay muchos módulos que no son módulos, son functores que crean módulos.

Esto también se podría implementar con registros o structs en C.

```ocaml
# type counter = {next : unit -> int ; reset: unit -> unit}
  
  let counter = 
    let n = ref 0 in
    {next = (function () -> incr n; !n); 
     reset = (function () -> n := 0)}
  ;;
type counter = { next : unit -> int; reset : unit -> unit; }
val counter : counter = {next = <fun>; reset = <fun>}
```

La función incr n, suma 1 a un int ref

```ocaml
# incr;;
- : int ref -> unit = <fun>
# let n = ref 0;;  (* Variable global *)
val n : int ref = {contents = 0}
# incr n;; (* n + 1 *)
- : unit = ()
# !n;;  (* Valor de n *)
- : int = 1
# incr n;; (* n + 1 *)
- : unit = ()
# !n;;  (* Valor de n *)
- : int = 2
```

Volviendo al contador con registros:

```ocaml
# counter.next ();;
- : int = 1
# counter.next ();;
- : int = 2
# counter.reset ();;
- : unit = ()
# counter.next ();;
- : int = 1
# counter.next ();;
- : int = 2
```

Vemos que también funciona. Los registros pueden funcionar como módulos.

Y también podría hacer una función que devolviese un contador:

```ocaml
# let new_counter () =
    let n = ref 0 in
    {next = (function () -> incr n; !n); 
     reset = (function () -> n := 0)};;
val new_counter : unit -> counter = <fun>
# let c = new_counter ();;
val c : counter = {next = <fun>; reset = <fun>}
# let cc = new_counter ();;
val cc : counter = {next = <fun>; reset = <fun>}
# c.next ();;
- : int = 1
# cc.next ();;
- : int = 1
```

## Objetos en OCaml

Como acabamos de ver en el apartado anterior, tanto los registros, como los módulos son muy versátiles en OCaml y pueden funcionan como objetos.

Por este motivo los objeto no son muy utilizados en OCaml.

Vamos a definoir un contador con objetos:

```ocaml
# let counter2 = object
    val mutable n = 0
    method next = n <- n + 1 ; n    (* Suma 1 *)
    method reset = n <- 0           (* Resetea el contador a 0 *)
  end;;
val counter : < next : int; reset : unit > = <obj>
```

Vemos que tiene 2 métodos, next y reset.

Estos métodos se invocan con nombre_del_objeto#metodo.

```ocaml
# counter#next;;
- : int = 1
# counter#next;;
- : int = 2
# counter#next;;
- : int = 3
# counter#reset;;
- : unit = ()
# counter#next;;
- : int = 1
# counter#next;;
- : int = 2
```

`OJO!`

```ocaml
# counter#next + (counter#reset; 2 * counter#next);;
- : int = 4
```
Valor de counter 2:

3 + 1 * 2 = 5.

No ha dado 5, ¿Y eso?

Dado que se avalua primero la expresión de la derecha. Entonces:

2*1 + 2 = 4.

Mucho `OJO`

Con objetos, a diferencia de los registros puedo hacer polimorfismo, es decir:

```ocaml
# let doble o = 2 * o#next;;
val doble : < next : int; .. > -> int = <fun>
```

Cualquier objeto con un método next, se puede aplicar a esa función.

```ocaml
# counter#reset;;
- : unit = ()
# doble counter;;
- : int = 2
# doble counter;;
- : int = 4
```

Ahora vamos a definir un objeto, diferente, pero con el método next:

```ocaml
# let counter' = object
    val mutable n = 100
    method next = n <- n + 2 ; n    (* Suma 1 *)
  end;;
val counter' : < next : int > = <obj>
# doble counter';;
- : int = 204
# doble counter';;
- : int = 208
```

Por lo tanto `counter` y `counter'` no son del mismo tipo, pero gracias al polimorfismo en objetos puedo aplicar la función `doble`.

Está solo requiere que un obj tenga el método next de tipo int.

Con reguistros solo podría pasar un solo tipo el no tener polimorfismo.

### Crear varios objetos del mismo tipo:

Como con los modulos y los registros puedo crear una función que me devuelva un nuevo contador:

```ocaml
# let new_counter () = object
    val mutable n = 0
    method next = n <- n + 1 ; n  (* Suma 1 *)
    method reset = n <- 0         (* Resetea el contador a 0 *)
  end;;
val new_counter : unit -> < next : int; reset : unit > = <fun>
# let c1 = new_counter ();;
val c1 : < next : int; reset : unit > = <obj>
# let c2 = new_counter ();;
val c2 : < next : int; reset : unit > = <obj>
# let c3 = new_counter ();;
val c3 : < next : int; reset : unit > = <obj>
```

Los objetos c1, c2, c3 son del mismo tipo, de hecho podemos ponerlos en una lista.

```ocaml
# [c1;c2;c3];;
- : < next : int; reset : unit > list = [<obj>; <obj>; <obj>]
```

### ¿Qué nos falta aquí? Las clases

Normalmente en los lenjuages orientados a onjetos tenemos que definiar la clase antes que los objetos.

Aquí puedo tener el objetos sin clase, pero tambien existen las clases, aunque como vemos podría vivir sin ellas.

Las clases proporcionan la caracteristica de la herencia, con la función `new_counter` no tengo.

Arriba tenia objetos inmediatos. ¿Cómo creo una clase?

Una clase en sí, es "una receta para crear objetos".

```ocaml
# class new_counter = object
    val mutable n = 0
    method next = n <- n + 1 ; n    (* Suma 1 *)
    method reset = n <- 0           (* Resetea el contador a 0 *)
  end;;
class new_counter :
  object val mutable n : int method next : int method reset : unit end
# let cc = new new_counter;;
val cc : new_counter = <obj>
```

Cuando defino clases lo que estoy haciendo es definir un `alias`, para un tipo de objeto, ahora new_counter es el nombre de los objetos que tienen el metodo reset de tipo unit y next de tipo int:

```ocaml
# [c1;c2;c3;cc];;
- : new_counter list = [<obj>; <obj>; <obj>; <obj>]
```

Vamos a hablar de la herencia:

```ocaml
# class counter = object
    val mutable n = 0
    method next = n <- n + 1 ; n    (* Suma 1 *)
    method reset = n <- 0           (* Resetea el contador a 0 *)
  end;;
class counter :
  object val mutable n : int method next : int method reset : unit end
```

```ocaml
# class counter_with_set = object
        inherit counter                   (* Todos los atributos de la clase counter *)
        method set x = n <- x             (* Un método nuevo *)  
  end;;
class counter_with_set :
  object
    val mutable n : int
    method next : int
    method reset : unit
    method set : int -> unit
  end
```

Con 'inherit' heredamos de una clase anterior.

La clase counter_with_set no seria igual al tipo counter, pero la podría restringir.

```ocaml
# let c = new counter_with_set;;
val c : counter_with_set = <obj>
# let cc = new counter;;
val cc : counter = <obj>
# [c;cc];;
Error: This expression has type counter
       but an expression was expected of type counter_with_set
       The first object type has no method set
```
Ahora vamos a retringir `c`, de la clase `counter_with_set` a `counter`.

```ocaml
# [(c :> counter) ;cc];;
- : counter list = [<obj>; <obj>]
```

Aunque en la lista se use como un `counter`, yo ouedo acceder al set y modificarlo.

Al heredar se puede editar una clase, por ejemplo:

```ocaml
class counter_with_init ini = object (self)
  inherit counter_with_set
  method reset = (* n <- ini *)
    self#set ini    (* Pasa el valor de ini *)
  initializer (* n <- ini *) 
    self#reset (* Se ejecuta al crear una instacia *)
end;;
```

Un metodo permite una espacio de reculsibidad abierta:

```ocaml
class counter_with_init'n'fin ini fin = object (self)
  inherit counter_with_init ini as super
  method next = let next = super#next in
    if next < fin then next
    else (self#reset; super#next)
end;;
```

Se podría hacer un contador con paso variable:

```ocaml
class counter_with_step = object (self)
	inherit counter_with_init 0 as super
	val mutable step = 0
	method next = n <- n + step; n
	method set_step s = step <- s
	method reset = super#reset; self#set_step 1
end;;
```

# Anexo

## Límites de precisión OCaml:

El valor máximo y mínimo que pueden representar un int y un float, se puede consultar:

```ocaml
# max_int;;
- : int = 4611686018427387903
# min_int;;
- : int = -4611686018427387904
# max_float;;
- : float = 1.79769313486231571e+308
# min_float;;
- : float = 2.22507385850720138e-308
```

## Medir tiempos de ejecución:

La funcion `Sys.time`, devuelve lo que el sistema operativo dice que lleva consumido este proceso de CPU en segundos.

Nota: `Sys.time no es funcional`, no es una función es una pseudofunción, es imperactivo.

```ocaml
# Sys.time;;
- : unit -> float = <fun>
Sys.time ();;
- : float = 81.111392
```

Sabiendo esto, para meder tiempos de ejecución:

1. Llamas a `Sys.time`.

2. Ejecutas el código.

3. Vuelve a llamar a `sys.time`.

4. Restas las 2 mediciones.

Una función para automatizarlo:

```ocaml
# (* Función automatizada para medir el tiempo de una función *)
  let crono f x = 
      let t = Sys.time () in
      let _ = f x in
      Sys.time () -. t;;
val crono : ('a -> 'b) -> 'a -> float = <fun>
```
Ejemplo de uso:

```ocaml
# crono fib 40;;
- : float = 3.32622699999998872
```

Si la función recibe 2 argumentos:

```ocaml
# (* Función automatizada para medir el tiempo de una función que tome 2 argumentos *)
  let crono2 f x y = 
      let t = Sys.time () in
      let _ = f x y in
      Sys.time () -. t;;
val crono2 : ('a -> 'b -> 'c) -> 'a -> 'b -> float = <fun>
```

Ejemplo de uso:

```ocaml
# crono2 rem 1000000000 2;;
- : float = 7.03057200000000648
```

## El Pattern Matching

El pattern matching consiste en comparar una expresión contra varios patrones hasta encontrar uno que coincida. Cada patrón puede desestructurar la expresión y enlazar partes de ella a variables. Si se encuentra un patrón coincidente, se ejecuta el código asociado a ese patrón. Como veremos más adelante es muy cómodo, por ejemplo para definir funciones para manejar las listas vistas arriba.

### Sintaxis básica

```ocaml
match expresión with
| patrón1 -> acción1
| patrón2 -> acción2
| ...
| patrónN -> acciónN
```

#### Un ejemplo con listas:

```ocaml
let describe_list lst =
  match lst with
  | [] -> "La lista está vacía"
  | [x] -> "La lista tiene un solo elemento"
  | x :: y :: _ -> "La lista tiene más de un elemento"
```

El patrón `[]`, representa la `lista vacía`, el `[x]` es la lista con `un solo elemento` y por último `x :: y :: _` es `cualquier otra` lista.

## TIPS 

En ocaml se puede poner _ entre números para marcal el . y leer más facil, ej: 1_000_000 un millon.

```ocaml
# 1_000_000;;
- : int = 1000000
```

## Números aleatorios

El módulo `Ramdom`. Algunas funciones:

1. Random.int int: Genera un número entero aleatorio entre 0 (inclusive) y el entero proporcionado (exclusivo).

2. Random.float float: Genera un número de punto flotante aleatorio entre 0.0 (inclusive) y el flotante proporcionado (exclusivo).

3. Random.bool (): Genera un valor booleano aleatorio (true o false).

```ocmal
# Random.int;;
- : int -> int = <fun>
# Random.int;;
- : int -> int = <fun>
# Random.int 10;;
- : int = 4
# Random.int 10;;
- : int = 5
# Random.int 10;;
- : int = 2
# Random.int 10;;
- : int = 1
```

Tip: Generar una lista aleatoria.

```ocaml
# let list = List.init 100_000 (fun _ -> Random.int 400_000);;
val list : int list =
  [180439; 307500; 344104; 7020; 219921; 278370; 155217; 226885; 95949;
   98678; 3615; 344412; 62401; 218606; 233428; 392869; 7289; 86393; 334014;
   33423; 143723; 256544; 154096; 124803; 248500; 373570; 139649; 193212;
   244755; 166211; 320357; 51197; 153897; 266460; 262183; 397763; 244720;
   163599; 296559; 339970; 156884; 149243; 195220; 195546; 208954; 345518;
   238988; 243358; 20424; 219051; 202309; 353069; 41376; 334286; 156438;
   287122; 139265; 341952; 58419; 64683; 302782; 333740; 136270; 249835;
   365136; 265791; 342168; 165324; 382222; 388156; 332835; 22328; 235636;
   129233; 87153; 352671; 202069; 393095; 226357; 127092; 50824; 200146;
   146278; 286133; 358688; 334989; 338295; 293158; 208393; 320601; 62456;
   147513; 97329; 291013; 48000; 122017; 273186; 395571; 219024; 49348;
   191836; 30011; 265671; 114232; 206465; 147649; 163931; 243450; 185569;
   240958; 14212; 48283; 142101; 204696; 350809; 261461; 268721; 332729;
   1181; 31697; 186383; 262776; 312830; 337731; 279154; 239039; 2524; 108814;
   124789; 306167; 260168; 393887; 281299; 92026; 241321; 115476; 347793;
   168395; 387768; 144263; 175962; 210673; 199636; 208677; 125298; 271423;
   267140; 224211; 223738; 307376; 11920; 59570; 258355; 390037; 387088;
   70990; 127210; 268207; 223051; 189443; 312004; 24095; 95493; 325061;
   191157; 255532; 163753; 89892; 373082; 196731; 263883; 302853; 143407;
   58965; 240360; 169845; 392366; 38117; 161951; 361054; 146400; 14445;
   26566; 241313; 154367; 247260; 323031; 8518; 218383; 322542; 304929;
   259811; 192487; 83268; 69347; 367106; 66207; 221570; 298569; 356546;
   68129; 131022; 385251; 367136; 366356; 110441; 229425; 108890; 28152;
   7207; 32054; 273610; 140838; 107802; 288938; 66380; 129514; 276718;
   333580; 9540; 178091; 326866; 207891; 23720; 279997; 191396; 128153;
   209605; 280542; 397124; 126388; 318687; 169136; 147173; 328188; 370963;
   124904; 256000; 208404; 182515; 112616; 213264; 140320; 359236; 30334;
   193886; 184391; 180188; 360012; 261130; 234846; 102454; 148438; 364655;
   238460; 206327; 322432; 113404; 34938; 105067; 107569; 213979; 27572;
   55462; 12566; 218411; 102760; 123927; 221971; 97347; 107061; 100301;
   89982; 332095; 226969; 66613; 378941; 392294; 203925; 98156; 52534;
   362992; 170254; 287140; 361787; 223014; 383178; 349737; 118772; 221285;
   334197; 90671; 328186; 94162; 237959; 383377; 31681; 101271; 83189; ...]
```

## Como llamar una función con un simbolo

Vamos a definir la división entera si que al dividir por 0 de error.

```ocaml
# type intplus = Int of int | Na;; (* Igual a int option *)
type intplus = Int of int | Na
# let div i1 i2 = match (i1,i2) with
      (_, Int 0) -> Na
    | (Int m, Int n) -> Int (m / n)
    | _ -> Na  (* En cualquier otro caso *)
  ;;   
val div : intplus -> intplus -> intplus = <fun>
```
Como pasar de div i1 i2 a i1 // i2:

```ocaml
# let (//) = div;;
val ( // ) : intplus -> intplus -> intplus = <fun>
```

Listo.

```ocaml
# Int 10 // Int 2;;
- : intplus = Int 5
# Int 10 // Int 0;;
- : intplus = Na
```
