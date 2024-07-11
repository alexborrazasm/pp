(* let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1;; 
Defina en un valor g1 el resultado de reescribir la definición anterior 
sin utizar && ni ||, osea con frases if-then-else *)

let g1 n = if n >= 0 then n mod 2 = 0 else n mod 2 = -1;;

let g2 n = match (n >= 0,n mod 2) with 
| (true,0) | (false,-1) -> true
| _ -> false
;;