val append : 'a array -> 'a array -> 'a array 
val sub : 'a array -> int -> int -> 'a array 
val copy : 'a array -> 'a array 
val fill : 'a array -> int -> int -> 'a -> unit 
val blit : 'a array -> int -> 'a array -> int -> int -> unit
val to_list : 'a array -> 'a list 
val iter : ('a -> unit) -> 'a array -> unit
val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b array -> 'a
val for_all : ('a -> bool) -> 'a array -> bool
val exists : ('a -> bool) -> 'a array -> bool 
val find_opt : ('a -> bool) -> 'a array -> 'a option 
