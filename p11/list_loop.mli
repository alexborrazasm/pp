val length : 'a list -> int
val last : 'a list -> 'a 
val nth : 'a list -> int -> 'a
val rev : 'a list -> 'a list
val append : 'a list -> 'a list -> 'a list
val concat : 'a list list -> 'a list 
val for_all : ('a -> bool) -> 'a list -> bool 
val exists : ('a -> bool) -> 'a list -> bool 
val find_opt : ('a -> bool) -> 'a list -> 'a option 
val iter : ('a -> unit) -> 'a list -> unit
val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a 