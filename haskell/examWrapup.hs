
wrapup [] = []
wrapup [x] = [[x]]
wrapup (x:y:xs) = let (h:t) = wrapup (y:xs) in if x == y then (x:h):t else [x] : (h:t)

lst = [1,1,1,2,3,3,2] 

a = [[1,1,1],[2],[3,3],[2]]

wrap [] = []
wrap lst = helper lst []

helper [] l = l
helper (x:xs) [] = helper xs [[x]]
helper (x:xs) l = let lastEl = head (last l) 
                      new = l ++ [[x]]
                      same = init l ++ [x : last l]
                        in if x == lastEl then helper xs same else helper xs new


bingo x y (s,t) = if x == y then (max s t) else (min s t)


