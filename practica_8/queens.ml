
let come (i1,j1) (i2,j2) =
  i1 = i2 || j1 = j2 || abs (i2-i1) = abs (j2 - j1);;


let compatible p l =
  not (List.exists (come p) l);;

let auxqueens n =
  let come (i1,j1) (i2,j2) =
    i1 = i2 || j1 = j2 || abs (i2-i1) = abs (j2 - j1)
    in let compatible p l = not (List.exists (come p) l)
  in let rec completar path i j =
     if i > n then Some path   (* Hemos terminado *)
     else if j > n then None   (* No se puede completar *)
     else if compatible (i,j) path then
        match completar ((i,j)::path) (i+1) 1 with
          | None -> completar path i (j+1)
          | Some sol -> Some sol
        else completar path i (j+1)
  in completar [] 1 1;;  

let queens n =
  let rec aux acc = function 
    | 0 -> acc
    | m -> aux (acc:(auxqueens m)) (m-1)
  in aux [] n;;