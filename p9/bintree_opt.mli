open Bintree

val is_bst : ('a -> 'a -> bool) -> 'a bintree -> bool

val bfs : 'a bintree -> 'a list

val bfs' : 'a bintree -> 'a list

val perfecto : 'a bintree -> bool

val casi_completo : 'a bintree -> bool
