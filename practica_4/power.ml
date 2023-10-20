let rec power x y = (* power 2 10 = 1024 *)
    if y = 0 
        then 1
    else x * power x (y-1);;

let rec power' x y = (* power 2 10 = 1024 *)
    if y = 0
        then 0
    else if (x mod 2) = 0
        then power (x * x) (y / 2)
    else x * power (x * x) (y / 2);;