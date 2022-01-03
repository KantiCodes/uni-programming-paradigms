data Aexp = Num Integer | Var String | Plus Aexp Aexp | Mult Aexp Aexp | Bracket Aexp deriving Show

subst :: Aexp -> (String -> Aexp)  ->  Aexp

-- subst is a higher-order function

subst (Num n) s = Num n
subst (Var x) s = s x
subst (Plus a1 a2) s = Plus a11 a21
                       where a11 = subst a1 s
                             a21 = subst a2 s
subst (Mult a1 a2) s = Mult a11 a21
                       where a11 = subst a1 s
                             a21 = subst a2 s

subst (Bracket a1) s = Bracket a11
                       where
                             a11 = subst a1 s

myexp = Plus  (Var "x") (Num 7)

mysub = \x -> if x == "x" then Plus (Num 2) (Num 2) else (Var "x")