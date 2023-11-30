let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec orbit n = 
  if n = 1 then "1"
  else string_of_int(n) ^ ", " ^ orbit (f n);;

let rec length n = 
  if n = 1 then 0
  else 1 + length (f n);;

let top n = 
  if n = 1 then 1
  else
    let rec aux n high =
      let fn = f n 
    in
      if fn = 1 then high
      else if fn > high then aux fn fn 
      else aux fn high
    in aux n 1;;

let length'n'top n =
  let rec aux n high c=
    let fn = f n 
  in
    if fn = 1 then (c,high)
    else if fn > high then aux fn fn (c + 1)
    else aux fn high (c + 1)
  in aux n 1 1;;

  (* Nota: al usar fg y calcular solo una vez f n mejoramos los tiempos de ejecución *)

let longest_in m n =
  let rec aux i inter high =
    let ilength = length i 
  in 
    if i = (n + 1) then (inter,high)
    else if ilength > high then aux (i+1) i ilength
    else aux (i+1) inter high
  in aux m 0 1;;

let highest_in m n =
  let rec aux i inter high =
    let itop = top i 
  in 
    if i = (n + 1) then (inter,high)
    else if itop > high then aux (i+1) i itop
    else aux (i+1) inter high
  in aux m 0 1;;