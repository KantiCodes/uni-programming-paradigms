data Term = Number String | Plus Term Term | Product Term Term | Parent Term deriving Show

myterm = Product (Number "two")   (Plus (Number "six") (Number "four"))


plain t = plainlist (atoms t)
          where
                atoms (Number x) = [x]
                atoms (Plus t1 t2) = atoms t1 ++ atoms t2
                atoms (Product t1 t2) = atoms t1 ++ atoms t2
                atoms (Parent t1) = atoms t1

                plainlist [] = True
                plainlist [x] = True
                plainlist (x:y:xs) = (x == y) && plainlist (y:xs)

--which is not a polymorphic function; 
--neither the argument type nor the result type contains type variables.


pretty (Number x) = show x
pretty (Plus t1 t2) = (pretty t1) ++ "+" ++ (pretty t2)
pretty (Product t1 t2) = (pretty t1) ++ "*" ++ (pretty t2)



compress [] = []
compress [x] = [(x,1)]
compress (x:ys) = let ((elem,n):zs) = compress ys
                  in
                        if x == elem then (elem,n+1):zs
                        else (x,1):((elem,n):zs)

--This is a function which uses ad hoc polymorphism; its type quantifies over the type classes Num and Eq .




decompress [] = []
decompress ((x,n):xs) = (repeat x n) ++ decompress xs
                        where
                          repeat x 0 = []
                          repeat x n = x : (repeat x (n-1))

                          
--This is also a function that uses ad hoc polymorphism. Its type quantifies over the type classes Num and Eq .


