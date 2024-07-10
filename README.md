# GEI-PP 614G010142324 - Paradigmas de Programación - Grao en Enxeñaría Informática (2023-2024)

Repositorio de las prácticas en [Ocaml](https://ocaml.org/).

Nota prácticas final: 2.0/2.0.

## ¿Como instalar Ocaml?

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

Instalamos la extensión de [Ocaml](https://marketplace.visualstudio.com/items?itemName=ocamllabs.ocaml-platform).

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

#