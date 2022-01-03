-- sum

-- 1 + 2 + 3 + 4 + 5  = sum(4) + 5

sum' 1 = 1
sum' n | n <= 0  = 0
       | n > 0   =  n + (sum' (n-1))

-- sum' ::  (Num t,Eq t) =>   t  ->  t

-- flip

-- 

flip' [] = []
flip' ((f,s):xs) = (s,f):(flip' xs)


-- flip'  ::     [(a,b)] -> [(b,a)]

-- stutter

stutter ::   (Eq t, Num t) =>   [a] -> t -> [a]
stutter [] _ = []
stutter (x:xs) n = (repeating x n) ++ (stutter xs n)
                   where
                      repeating x 0 = []
                      repeating x n = x : (repeating x (n-1))

-- :   :: a -> [a] -> [a]
-- ++  :: [a] -> [a] -> [a]
my_flip :: [(a,b)] -> [(b,a)]
my_flip [] = []
my_flip ((f,s):xs) = (s,f):my_flip xs

a = [1,2]++[3,4]
b = 4:[1, 2, 3]