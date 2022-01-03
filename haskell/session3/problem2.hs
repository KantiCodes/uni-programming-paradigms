data MyT = Int | Pair MyT MyT | Arrow MyT MyT
instance Show MyT where
    show Int = "Int"
    show (Arrow m n) = show m ++ "->" ++ show n



data Term =  N Integer | Var String | Bracket Term Term |
 Tog Term Term | Lambda String MyT Term
instance Show Term where
    show (N n) = "n"
    show (Var x) = "x"
    show (Bracket t1 t2) = "("++show t1 ++ "," ++show t2++")"
    show (Tog t1 t2) = show t1++ show t2


takeSomethingReturnSomething = Lambda "s" Int (Var "s")
