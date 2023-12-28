type ('a, 'b) queue = Empty | Node of 'a  * 'b * ('a, 'b) queue * ('a, 'b) queue

let empty = Empty

let rec insert queue prio elt =
    match queue with
      Empty -> Node (prio, elt, Empty, Empty)
    | Node (p, e, left, right) ->
        if prio < p
        then Node (prio, elt, insert right p e, left)
        else Node (p, e, insert right prio elt, left)
    
let rec rebuild left right = match (left, right) with
    Empty, t | t, Empty -> t
  | Node (lprio, lv, lleft, lright), Node (rprio, rv, rleft, rright) ->
         if lprio <= rprio
            then Node (lprio, lv, rebuild lleft lright, right)
            else Node (rprio, rv, left, rebuild rleft rright)
    
let extract = function
      Empty -> None
    | Node (prio, elt, left, right) -> Some (prio, elt, rebuild left right)

    

    
