type ('a, 'b) queue
(* colas de prioridad (mínima) mutable para elementos de tipo 'b con prioridades de tipo 'a *)

exception EmptyQueue

val new_queue : unit -> ('a, 'b) queue
(* devuelve una nueva cola vacía *)

val insert : ('a, 'b) queue -> 'a -> 'b -> unit
(* insert q p e añade a la cola q el elemento e con prioridad p *)

val extract : ('a, 'b) queue -> ('a * 'b)
(* Devuelve un elemento (y su prioridad) de prioridad mínima y lo elimina de la cola *)  
(* Activa la excepción EmptyQueue si la cola está vacía *)

val extract_opt : ('a, 'b) queue -> ('a * 'b) option
