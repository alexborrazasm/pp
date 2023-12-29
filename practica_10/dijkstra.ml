open M_MinPrioQueue;;
(* colas de prioridad (mínima) mutable para elementos de tipo 'b con prioridades de tipo 'a *)

let matriz0   = [|[|None; None; None|];
                  [|None; None; None|];
                  [|None; None; None|]|];;

let matriz1   = [|[|None; None; None|];
                  [|None; None; None|];
                  [|None; None|]|];;

let matriz2   = [|[|None; None; None|];
[|None; None; None|];
[|None; None; Some (-10)|]|];;

let matrix   = [|[|Some 1; Some 1; Some 1|];
                  [|Some 1; Some 1; Some 1|];
                  [|Some 1; Some 1; Some 1|]|];;

let matrix1   = [|[|Some 1; Some 1; Some 1|];
[|Some 1; Some (-1); Some 1|];
[|Some 1; Some 1; Some 1|]|];;

(*----------------------------------------------------------------------------------*)

let is_square matrix = (* Función que nos dice si una matriz es cuadrada *)
  let row = Array.length matrix 
  in for i = 0 to row - 1 do 
    if Array.length matrix.(i) <> row then raise (Failure "Invalid_argument “dijkstra”")
  done;;

let is_positive matrix = (* Función que nos dice si una matriz es positiva *)
  let row = Array.length matrix in
  for i = 0 to row - 1 do
    for j = 0 to Array.length matrix.(i) - 1 do
      if matrix.(i).(j) = None then ()
      else if matrix.(i).(j) < Some 0 then raise (Failure "Invalid_argument “dijkstra”")
    done
  done;;

  let is_square_positive matrix = (* Función que nos dice si una matriz es positiva y cuadrada*)
  let row = Array.length matrix in
  for i = 0 to row - 1 do
    if Array.length matrix.(i) <> row then raise (Failure "Invalid_argument “dijkstra”");
    for j = 0 to Array.length matrix.(i) - 1 do
      if matrix.(i).(j) = None then ()
      else if matrix.(i).(j) < Some 0 then raise (Failure "Invalid_argument “dijkstra”")
    done
  done;;
(******************************************************************************************************)
type ('a, 'b) queue = {mutable queue : ('a, 'b) node option}
and  ('a, 'b) node = {mutable prio: 'a; mutable ele: 'b; 
                      mutable left: ('a, 'b) queue; 
                      mutable right: ('a, 'b) queue}
                     
exception EmptyQueue                     

let new_queue () = {queue = None}     

let rec insert ({queue = q0} as q) p e = 
    match q0 with
      None -> q.queue <- Some {prio = p; ele = e; left = {queue = None}; right = {queue = None}}
    | Some ({prio = p0; ele = e0; left = l0; right = r0} as n) ->
        if p <= p0
        then begin n.prio <- p; n.ele <- e; n.left <- r0; n.right <- l0;
                   insert r0 p0 e0                  
             end
        else begin n.left <- r0; n.right <- l0;
                   insert r0 p e
             end  
              
let rec remove_top ({queue = q0} as q) = match q0 with
      None -> ()
    | Some ({left = {queue = None}; right = {queue = None}; _}) -> 
            q.queue <- None 
    | Some ({left = {queue = l0}; right = {queue = None}; _}) -> 
            q.queue <- l0
    | Some ({left = {queue = None}; right = {queue = r0}; _}) -> 
            q.queue <- r0
    | Some ({left = {queue = Some l_node}; right = {queue = Some r_node}; _} as n0) -> 
            if l_node.prio <= r_node.prio 
            then begin
              n0.prio <- l_node.prio; n0.ele <- l_node.ele;
              remove_top n0.left
            end
            else begin
              n0.prio <- r_node.prio; n0.ele <- r_node.ele;
              remove_top n0.right
            end

let extract ({queue = q0} as q) = match q0 with
    None -> raise EmptyQueue
  | Some {prio = p; ele = e; _} -> remove_top q; (p,e)


let extract_opt ({queue = q0} as q) = match q0 with
    None -> None 
  | Some {prio = p; ele = e; _} -> remove_top q; Some (p,e)
 

(*******************************************************************************************************)
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
    let not_visited = new_queue () in
    for j = 0 to rows - 1 do 
      dist.(n).(j)<-prev.(n).(j);           (* Copiamos el grafo en la solución *)
      insert not_visited prev.(n).(j) j;    (* Metemos todos los nodos en la cola de prioridad *)
    done;

    let min = ref (extract_opt not_visited) in

    while !min <> None do                   (* Bucle principal *)
      let flatten = fun Some par -> par in 
      match flatten !min with
        | Some prio, elem -> for v = 0 to rows - 1 do
                               
      min := extract_opt not_visited
    done;
  done;
  dist
  ;;
