let rec reverse n = (* 1234 -> 4321 *)
    if n < 10 then n
    else
      let rec n_cifras n =
        if n = 0 then 0
        else 1 + n_cifras (n / 10)
      in
      let rec exp10 n =
        if n = 0 then 1
        else 10 * exp10 (n - 1)
      in
      (n mod 10) * exp10 (n_cifras n - 1) + reverse (n / 10)

let rec palindromo s = (* hola -> false | eme -> true *)
    let rec contador i =
        if i >= (String.length s - i)
            then true
        else if s.[i] <> s.[String.length s - i - 1]
            then false
        else contador (i + 1)
    in contador 0;;

let rec mcd (x,y) = (* algoritmo de Euclides *)
  if x mod y = 0 then y
  else mcd (y, x mod y);;