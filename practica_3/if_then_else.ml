(* if x > y then "first is greater" else "second is greater";; *)
(function true -> "first is greater" | false -> "second is greater") (x > y);;
(* if x > 0 then x else -x;; *)
(function true -> x | false -> -x) (x > 0);;
(* if x > 0 then x else if y > 0 then y else 0;; *)
(function true -> x | false -> (function true -> y | false -> 0) (y > 0)) (x > 0);;
(* if x > y then if x > z then x else z else if y > z then y else z;; *)
(function true -> (function true -> x | false -> z ) (x > z) | false -> (function true -> y | false -> z) (y > z)) (x > y);;
