data MyT = Int | Pair MyT MyT | Arrow MyT MyT
instance Show MyT where
    show Int = "Int"
    show (Arrow m n) = show m ++ "->" ++ show n


int2int = Arrow Int Int

-- aux (Arrow m n) = m "->" n


myfunc a = 1