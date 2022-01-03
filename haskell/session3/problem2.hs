data MyT = Int | Pair MyT MyT | Arrow MyT MyT


data Term =  N Integer | Var String | Bracket Term Term |
 Tog Term Term | Lambda String MyT Term | SayWowo
instance Show Term where
    show (N n) = "n"
    show (Var x) = "x"
    show (Bracket t1 t2) = "("++show t1 ++ "," ++show t2++")"
    show (Tog t1 t2) = show t1++ show t2


-- gowno = Bracket (Comma N Nil) Nil

takeSomethingReturnSomething = Lambda "s" Int (Var "s")
