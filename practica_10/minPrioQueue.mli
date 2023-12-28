type ('a, 'b) queue
(* Colas de prioridad para valores de tipo 'b con prioridades de tipo 'a implementadas sobre montículos binarios *)
(* El primer elemento de la cola será siempre uno que tenga la prioridad mínima según la relación (<=) sobre el tipo 'a *)
val empty : ('a, 'b) queue
(* la cola vacía *)
val insert : ('a, 'b) queue -> 'a -> 'b -> ('a, 'b) queue 
(* insert q p v devuelve la cola que resulta al añadir a q el valor v con prioridad p *)
val extract : ('a, 'b) queue -> ('a * 'b * ('a, 'b) queue) option
(* devuelve la priorida y el valor del primer elemento de la cola y una nueva cola sin el primer elemento de la original *)
 
    
