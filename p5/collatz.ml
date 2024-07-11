let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec orbit n =
  if n = 1 then "1" 
  else string_of_int (n) ^ ", " ^ orbit (f n)
;;

let length x = if x < 1 then raise (Failure "Número inválido")
  else 
  let rec aux a b =
    if a = 1 then b
    else aux (f a) (b+1)
in aux x 0
;;

let top x = 
  let rec aux (a,b) = if a = 1 then b 
  else aux (f a,max a b)
in aux (x,0)
;;  

let rec length'n'top n =
  if n = 1 then (0,1)
  else let length, top = length'n'top (f n)
  in (length + 1, max n top)
;;

let longest_in x y = 
  let rec aux (i,longest,numero) =
    if i > y then (numero,longest) 
    else let len = length i in if len> longest then aux (i+1,len,i)
      else aux (i+1,longest,numero)
in aux (x,0,0)
;;

let highest_in x y = 
  let rec aux (i,highest,numero) =
    if i > y then (numero,highest) 
    else let high = top i in if high > highest then aux (i+1,high,i)
      else aux (i+1,highest,numero)
in aux (x,0,0)
;;