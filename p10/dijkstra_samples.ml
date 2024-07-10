(*

Ejemplos para el ejercicio de la práctica 10 
La siguiente expresión debe evaluar a true:
dijkstra v1 = sol1 && 
dijkstra v2 = sol2 &&
dijkstra v3 = sol3 &&
dijkstra v4 = sol4;;  

*)

let v1 = 
 [|[|Some 2; Some 1; Some 2|]; 
   [|Some 3; Some 0; None|];
   [|Some 0; Some 2; None|]|];;
   
let sol1 =
[|[|Some 0; Some 1; Some 2|]; 
  [|Some 3; Some 0; Some 5|];
  [|Some 0; Some 1; Some 0|]|];;


let v2 = 
[|[|None;   Some 0; Some 2; Some 3|]; 
  [|None;   Some 1; Some 8; Some 8|];
  [|None;   Some 5; None;   Some 2|]; 
  [|Some 0; Some 3; Some 5; None|]|];;
 
let sol2 =   
[|[|Some 0; Some 0; Some 2; Some 3|]; 
  [|Some 8; Some 0; Some 8; Some 8|];
  [|Some 2; Some 2; Some 0; Some 2|]; 
  [|Some 0; Some 0; Some 2; Some 0|]|];;
  
    
let v3 = 
[|[|Some 9; Some 8; Some 10; None;   Some 4|];
  [|Some 3; Some 4; Some 2;  Some 6; Some 5|];
  [|Some 9; Some 3; Some 9;  Some 5; Some 10|];
  [|None;   Some 2; Some 10; Some 9; Some 5|];
  [|Some 3; Some 5; Some 5;  Some 3; None|]|];;
    
let sol3 = 
[|[|Some 0; Some 8; Some 9; Some 7; Some 4|];
  [|Some 3; Some 0; Some 2; Some 6; Some 5|];
  [|Some 6; Some 3; Some 0; Some 5; Some 8|];
  [|Some 5; Some 2; Some 4; Some 0; Some 5|];
  [|Some 3; Some 5; Some 5; Some 3; Some 0|]|];;
  
  
let v4 = 
  [|[|None;    Some 10; Some 27; Some 19; Some 15; None;    Some 71; None;    None;    Some 41|];
    [|Some 99; Some 96; None;    Some 33; Some 32; Some 25; None;    Some 37; Some 23; Some 38|];
    [|Some 74; None;    Some 26; Some 85; Some 99; Some 43; Some 91; None;    Some 96; Some 36|];
    [|Some 94; Some 80; Some 10; Some 89; Some 57; Some 24; None;    Some 54; None;    Some 17|];
    [|Some 78; Some 34; Some 41; Some 78; Some 10; Some 28; Some 25; Some 82; Some 44; Some 72|];
    [|Some 68; Some 95; Some 98; None;    Some 28; Some 27; Some 75; Some 54; Some 22; Some 44|];
    [|None;    Some 87; Some 69; Some 23; Some 43; Some 48; Some 31; Some 75; Some 34; Some 19|];
    [|Some 94; Some 97; None;    Some 25; Some 38; Some 59; Some 53; Some 79; Some 72; Some 49|];
    [|Some 67; Some 61; None;    Some 12; Some 86; None;    Some 95; Some 31; None;    Some 59|];
    [|Some 24; Some 30; None;    Some 40; None;    Some 99; None;    Some 92; Some 71; Some 38|]|];;
    
let sol4 = 
[|[|Some 0;  Some 10; Some 27; Some 19; Some 15; Some 35; Some 40; Some 47; Some 33; Some 36|];
  [|Some 62; Some 0;  Some 43; Some 33; Some 32; Some 25; Some 57; Some 37; Some 23; Some 38|];
  [|Some 60; Some 66; Some 0;  Some 76; Some 71; Some 43; Some 91; Some 96; Some 65; Some 36|];
  [|Some 41; Some 47; Some 10; Some 0;  Some 52; Some 24; Some 77; Some 54; Some 46; Some 17|];
  [|Some 68; Some 34; Some 41; Some 48; Some 0;  Some 28; Some 25; Some 71; Some 44; Some 44|];
  [|Some 68; Some 62; Some 44; Some 34; Some 28; Some 0;  Some 53; Some 53; Some 22; Some 44|];
  [|Some 43; Some 49; Some 33; Some 23; Some 43; Some 47; Some 0;  Some 65; Some 34; Some 19|];
  [|Some 66; Some 72; Some 35; Some 25; Some 38; Some 49; Some 53; Some 0;  Some 71; Some 42|];
  [|Some 53; Some 59; Some 22; Some 12; Some 64; Some 36; Some 84; Some 31; Some 0;  Some 29|];
  [|Some 24; Some 30; Some 50; Some 40; Some 39; Some 55; Some 64; Some 67; Some 53; Some 0|]|];;   
 
 
dijkstra v1 = sol1 && 
dijkstra v2 = sol2 &&
dijkstra v3 = sol3 &&
dijkstra v4 = sol4;;  
    
