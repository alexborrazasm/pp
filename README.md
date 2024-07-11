# GEI-PP 614G010142324 - Paradigmas de Programación - Grao en Enxeñaría Informática (2023-2024)

Repositorio de las prácticas en [OCaml](https://ocaml.org/).

Nota prácticas final: 2.0/2.0.

## ¿Como instalar OCaml?

1. **Abrimos una terminal en linux**
    
    en debian/ubuntu/mint:
    ```bash
    sudo apt update 
    sudo apt upgrade
    sudo apt install ocaml opam rlwrap 
    ```
    en Arch o derivadas:
    ```bash
    sudo pacman -Syyu ocaml opam rlwrap
    ```
    en Red Hat/CentOS/Fedora:
    ```bash
    sudo dnf upgrade
    sudo dnf upgrade
    sudo dnf install ocaml opam rlwrap
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

## Evaluación en OCaml

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

Para el resto Módulo.Nombre.

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

### Otro uso de lps pares

Para implementar operaciones que devuelven varios resultados necesitamos el producto cartesiano. Ejemplo:

```ocaml
# let sp n m = n + m, n * m;;
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


