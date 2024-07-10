(* let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1;; 
Defina en un valor g1 el resultado de reescribir la definición anterior 
sin utizar && ni ||, osea con frases if-then-else *)

let g1 n = 
  if n mod 2 = 0
    then true
  else false;;

let g2 n = (n mod 2 = 0);;      