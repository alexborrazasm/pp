type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree

val in_order : 'a bintree -> 'a list

val insert : ('a -> 'a -> bool) -> 'a bintree -> 'a -> 'a bintree

val bst : ('a -> 'a -> bool) -> 'a list -> 'a bintree

val qsort : ('a -> 'a -> bool) -> 'a list -> 'a list
