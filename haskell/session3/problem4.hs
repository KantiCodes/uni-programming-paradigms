data MyT = Int | Pair MyT MyT | Arrow MyT MyT | Maybe MyT deriving (Eq, Show)

xt= ("name", Int)
pairx= ("name-surname", Pair Int Int)
my_env = [xt, pairx]

get_by_key [] key = Nothing
get_by_key ((currk,t):xs) key = if key == currk then (Just t) else (get_by_key xs key)
fun (x:xs) = if x == 3 then x else fun xs

res = get_by_key my_env "namer"
respar = get_by_key my_env "name-surname"


upd (x,t) [] = [(x,t)]
upd (x,t) ((y,t1):env1) = if (x==y) then ((x,t):env1) else (y,t1):(upd (x,t) env1)