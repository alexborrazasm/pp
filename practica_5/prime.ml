(*  let is_prime n =
      let rec check_from i =
        i >= n ||
        (n mod i <> 0 && check_from (i+1))
        in check_from 2;; 
*)

let rec next_prime n =
    let is_prime n =
        let rec check_from i =
          i >= n ||
          (n mod i <> 0 && check_from (i+1))
          in check_from 2
        in
    if (is_prime (n + 1) = true)
        then n + 1
    else next_prime (n + 1);;

let rec last_prime n = 
    let is_prime n =
        let rec check_from i =
          i >= n ||
          (n mod i <> 0 && check_from (i+1))
          in check_from 2
        in
    if (is_prime n = true)
        then n
    else next_prime (n - 1);;

let is_prime2 n =
    let rec check_from i =
        if i >= n / i then true
        else if n mod i = 0 then false
        else check_from (i + 1)
    in check_from 2;;

(*  # crono is_prime 1_000_000_007;;
    - : float = 12.6044029999999943
    # crono is_prime2 1_000_000_007;;
    - : float = 0.0009840000000025384 *)