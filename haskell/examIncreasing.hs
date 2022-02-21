
--increaasing [] = True 
increasing [x] = True 
increasing (x:y:xs) = if y > x then increasing (y:xs) else False 

lst = [1,2,7,484000,25]

lst2 = ["Ged","abe","hest"]


madrascurry :: (t -> t -> t) -> t -> t -> t
madrascurry f x y = f (f x x) y