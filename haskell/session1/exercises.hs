fib :: (Eq t, Num t) => t -> t
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

rev :: [t] -> [t]
rev [] = []
rev (x:xs) = rev(xs) ++ [x]

ispalindrome :: (Eq t) => [t] -> Bool
ispalindrome l = (l == rev l)

last1 :: (Eq a) => [a] -> a
last1 (x:[]) = x
last1 (x:xs) = last1 xs
