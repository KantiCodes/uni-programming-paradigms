data Maybe MyT = Just Int |Just Pair MyT MyT | Just Arrow MyT MyT  
instance Show MyT where
    show Int = "Int"
    show (Arrow m n) = show m ++ "->" ++ show n

xt= ("name", Int)
pairx= ("name-surname", Pair Int Int)
my_env = [xt, pairx]


get_by_key [] key = Nothing
get_by_key ((currk,t):xs) key = if key == currk then t else (get_by_key xs key)
fun (x:xs) = if x == 3 then x else fun xs
