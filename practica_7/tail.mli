val to0from : int -> int list
val fromto : int -> int -> int list
val remove : 'a -> 'a list -> 'a list
val compress : 'a list -> 'a list
val append' : 'a list -> 'a list -> 'a list
val map' : ('a -> 'b) -> 'a list -> 'b list
val fold_right' : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
val incseg : int list -> int list
