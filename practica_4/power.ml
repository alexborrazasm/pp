let rec power x y = (* power 2 10 = 1024 *)
    if y = 0 
        then 1
    else x * power x (y-1);;

let rec power' x y = (* power' 2 10 = 1024 *)
    if y = 0
        then 1
    else if (y mod 2) = 0
        then power' (x * x) (y / 2)
    else 
        x * power' (x * x) (y / 2);;

(* La segunda implementación, power', que utiliza la recursión con división y módulo, es más eficiente en términos de tiempo de ejecución en comparación con la 
primera implementación, power. power' utiliza una técnica de exponenciación rápida, que reduce significativamente el número de multiplicaciones realizadas, a 
diferecna de power, esto hacer a power' mucho más eficiente en términos de tiempo, especialmente cuando la entrada es muy grande.
Como se demuestra aqui empiricamente:
# crono power 2 200000;;
- : float = 0.0062960000000000238
# crono power' 2 200000;;
- : float = 6.00000000000600053e-06
*)

let rec powerf x y = (* powerf 2. 10 = 1024 *)
        if y = 0 then 1. 
        else if (y mod 2) = 0 then powerf (x *. x) (y / 2)
        else x *. powerf (x *. x) (y / 2);; 

