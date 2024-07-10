type ('a, 'b) queue = {mutable queue : ('a, 'b) node option}
and  ('a, 'b) node = {mutable prio: 'a; mutable ele: 'b; 
                      mutable left: ('a, 'b) queue; 
                      mutable right: ('a, 'b) queue}
                     
exception EmptyQueue                     

let new_queue () = {queue = None}     

let rec insert ({queue = q0} as q) p e = 
    match q0 with
      None -> q.queue <- Some {prio = p; ele = e; left = {queue = None}; right = {queue = None}}
    | Some ({prio = p0; ele = e0; left = l0; right = r0} as n) ->
        if p <= p0
        then begin n.prio <- p; n.ele <- e; n.left <- r0; n.right <- l0;
                   insert r0 p0 e0                  
             end
        else begin n.left <- r0; n.right <- l0;
                   insert r0 p e
             end  
              
let rec remove_top ({queue = q0} as q) = match q0 with
      None -> ()
    | Some ({left = {queue = None}; right = {queue = None}; _}) -> 
            q.queue <- None 
    | Some ({left = {queue = l0}; right = {queue = None}; _}) -> 
            q.queue <- l0
    | Some ({left = {queue = None}; right = {queue = r0}; _}) -> 
            q.queue <- r0
    | Some ({left = {queue = Some l_node}; right = {queue = Some r_node}; _} as n0) -> 
            if l_node.prio <= r_node.prio 
            then begin
              n0.prio <- l_node.prio; n0.ele <- l_node.ele;
              remove_top n0.left
            end
            else begin
              n0.prio <- r_node.prio; n0.ele <- r_node.ele;
              remove_top n0.right
            end

let extract ({queue = q0} as q) = match q0 with
    None -> raise EmptyQueue
  | Some {prio = p; ele = e; _} -> remove_top q; (p,e)


let extract_opt ({queue = q0} as q) = match q0 with
    None -> None 
  | Some {prio = p; ele = e; _} -> remove_top q; Some (p,e)
 

