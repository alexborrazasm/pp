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

## Tipos de datos en OCaml

OCaml tiene un sistema de tipos estático y fuerte.

El compilador para poder compilar tiene que ser capaz de averiguar que tipo de la expresión. Por ejemplo un float (1.45) o int (56).

Esto pasa duracte la fase de compilación. Tipado estático.

En otros lenguajes puede ser dinámico (se decide durante la ejecución).

### Tipos Primitivos

#### Enteros (int): Representan números enteros
En el compilador interactivo:
```ocaml
# 1;;
- : int = 1
```

#### Punto flotante (float): Representan números de punto flotante (decimales)

```ocaml
# 1.7;;
- : float = 1.7
```

#### Booleanos (bool): Representan valores booleanos (true o false)

```ocaml
# true;;
- : bool = true
# false;;
- : bool = false
```

#### Caracteres (char): Representan caracteres individuales

```ocaml
# 'a';;
- : char = 'a'
# 'C';;
- : char = 'C'
```

#### Cadenas (string): Representan secuencias de caracteres

```ocaml
# "Hello, world!";;
- : string = "Hello, world!
```

`OJO: '' -> char y "" -> string`

### Operaciones con **Tipos Primitivos**:

Ocaml tiene signos diferentes la suma y el producto, según el tipo.

#### Suma (+), Resta (-), Producto (*) y División (/) de int:

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

#### Suma (+.), Resta (-.), Producto (*-) y División (/.) de float:

```ocaml
# 3.3 +. 6.8;;
- : float = 10.1
# 4.7 -.  6.9;;
- : float = -2.2
# 4.7 *. 6.9;;
- : float = 32.43
# 4.7 /.  6.9;;
- : float = 0.6811594202898551
```

#### Conversiones de tipo: 

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

#### Concatenar (^) strings:

```ocaml
# "Hola" ^ " y adiós";;
- : string = "Hola y adiós"
```

