import Data.Set


data MyT = Int | Pair MyT MyT | Arrow MyT MyT



data Term =  N Integer | Var String | Bracket Term Term |
 App Term Term | Lambda String MyT Term
instance Show Term where
    -- show (N n) = "n"
    -- show (Var x) = "x"
    -- show (Bracket t1 t2) = "("++show t1 ++ "," ++show t2++")"
    -- show (App t1 t2) = show t1++ show t2



removeItem :: Eq a => a -> [a] -> [a]
removeItem _ []                 = []
removeItem x (y:ys) | x == y    = removeItem x ys
                    | otherwise = y : removeItem x ys

eS = empty
fV (N n) = []
fV (Var x) = [x]
fV (Bracket e1 e2) =  fV (e1) ++ fV (e2)
fV (App e1 e2) = fV (e1) ++ fV (e2)


fV (Lambda varName varType ex) =  removeItem varName (fV ex) 

xyz = Lambda "x" Int (Bracket (Var "x") (Var "y"))

multiplyByFour x = 4 * x

times4List = Prelude.map (4 *)[1,2,3,4]


uniqeAdd x cand = if (elem cand x) then x else cand:x
-- addTwoLists x y = map uniqeAdd x

doublex = Lambda "x" Int (Bracket (Bracket(Var "x") (Var "y")) (Var "y"))



isClosed x = if x == empty then True else False






func (x:xs) = 5

-- fromList and union are operations on a Set
fV' (N n) = empty
fV' (Var x) = fromList [x]
fV' (Bracket e1 e2) =  union (fV' (e1))  (fV' (e2))
fV' (App e1 e2) = union (fV' (e1))  (fV' (e2))
fV' (Lambda varName varType ex) =  delete varName (fV' ex) 

res_name = fV' (Var "name")
res_empty = fV' (N 5)
res_empty1 = fV' (Bracket (N 5) (N 7))
res_name2 = fV' (Bracket (Var "name") (Var "name"))