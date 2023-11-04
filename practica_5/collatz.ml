let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1

let rec orbit n = 
    if n = 1 then "1"
    else string_of_int(n) ^ ", " ^ orbit (f n);;

let rec length n = 
    if n = 1 then 0
    else 1 + length (f n);;

let top n =
    let rec aux i =
        if f n = 1 then i
        if f n > i then aux n
        else  
    in aux 0