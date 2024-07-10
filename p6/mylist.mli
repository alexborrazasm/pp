val hd: 'a list -> 'a

val tl: 'a list -> 'a list

val length: 'a list -> int

val compare_lengths : 'a list -> 'b list -> int

val compare_length_with : 'a list -> int -> int

val init : int -> (int -> 'a) -> 'a list

val nth : 'a list -> int -> 'a

val append : 'a list -> 'a list -> 'a list
(* not tail recursive *)

val rev_append : 'a list -> 'a list -> 'a list

val rev : 'a list -> 'a list

val concat : 'a list list -> 'a list
(* not tail recursive *)

val flatten : 'a list list -> 'a list
(* not tail recursive *)

val split : ('a * 'b) list -> 'a list * 'b list
(* not tail recursive *)

val combine : 'a list -> 'b list -> ('a * 'b) list
(* not tail recursive *)

val map : ('a -> 'b) -> 'a list -> 'b list
(* not tail recursive *)

val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
(* not tail recursive *)

val rev_map : ('a -> 'b) -> 'a list -> 'b list

val for_all : ('a -> bool) -> 'a list -> bool

val exists : ('a -> bool) -> 'a list -> bool

val mem : 'a -> 'a list -> bool

val find : ('a -> bool) -> 'a list -> 'a

val filter : ('a -> bool) -> 'a list -> 'a list

val find_all : ('a -> bool) -> 'a list -> 'a list

val partition : ('a -> bool) -> 'a list -> 'a list * 'a list

val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a

val fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
(* not tail recursive *)

val assoc : 'a -> ('a * 'b) list -> 'b

val mem_assoc : 'a -> ('a * 'b) list -> bool

val remove_assoc : 'a -> ('a * 'b) list -> ('a * 'b) list
(* not tail recursive *)
