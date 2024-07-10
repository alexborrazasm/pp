open M_MinPrioQueue;;
(* colas de prioridad (mínima) mutable para elementos de tipo 'b con prioridades de tipo 'a *)

let dijkstra prev =
  let rows = Array.length prev in  (* número de filas *)
  let is_square_positive matrix =   (* Función que nos dice si una matriz es positiva y cuadrada*)
  for i = 0 to rows - 1 do
    if Array.length matrix.(i) <> rows then raise (Failure "Invalid_argument “dijkstra”");
    for j = 0 to Array.length matrix.(i) - 1 do
      if matrix.(i).(j) = None then ()
      else if matrix.(i).(j) < Some 0 then raise (Failure "Invalid_argument “dijkstra”")
    done
  done in

  is_square_positive prev;  (* Ejecutamos las comprobaciones *)

  let dist = Array.make_matrix rows rows None in

  for n = 0 to rows - 1 do 
    let not_visited = Array.make rows false in
    let heap = new_queue () in
    for j = 0 to rows - 1 do 
      not_visited.(j)<-true;         (* Nodos ya visitados *)
      dist.(n).(j)<-prev.(n).(j);    (* Copiamos el grafo en la solución *)
      insert heap prev.(n).(j) j;    (* Metemos todos los nodos en la cola de prioridad *)
    done;
    not_visited.(n)<-false;          (* Ya hemos visitado el nodo inicial *)

    let min = ref (extract heap) in
    (*let alt = Some max_int in*)

    while !min <> (None, -1) do
      (*match !min with (prio, node) -> 
        not_visited.(node)<-false;
          for i = 0 to rows - 1 do
            if not_visited.(i) && dist.(n).(i) < alt then
              alt := dist.(n).(i);
          done;*)
      min := (try extract heap with
              | EmptyQueue -> (None, -1))
    done;
  done;
  dist
;;