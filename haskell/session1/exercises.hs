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

cfrac :: (Eq a, Integral t, Num a, RealFrac a1) => a1 -> a -> [t]
cfrac r 0 = []
cfrac r n = a : (remainfrac r1)
                where
                a = truncate r
                r1 = (r - (fromIntegral a))
                remainfrac r1 = cfrac (1/r1) (n - 1)



flatten [] = []
flatten (x:xs) = x ++ (flatten xs)