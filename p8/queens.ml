(* int -> (int * int) list list *)
let queens n =
  let come (i1, j1) (i2, j2) =
    i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1)
  in
  let compatible p l =
    not (List.exists (come p) l)
  in
  let rec completar path i j =
    if i > n then [path]                   (* Hemos encontrado una solución *)
    else if j > n then []                  (* No se puede completar desde esta posición *)
    else if compatible (i, j) path 
      then List.append (completar ((i, j) :: path) (i + 1) 1) (completar path i (j + 1))
    else completar path i (j + 1)
  in List.filter (fun sol -> List.length sol = n) (completar [] 1 1);;

(* (int * int) list -> bool *)
let rec is_queens_sol n = function
  | [] -> true
  | (i,j)::t -> let come (i1, j1) (i2, j2) =
    i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1)
  in
    let compatible p l = not (List.exists (come p) l)
  in
    if i > n || j > n then false  
    else if compatible (i,j) t then is_queens_sol n t
    else false;;