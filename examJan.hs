import Data.List (nub)
data Nesting a b = S (a,b) | C (Nesting a b,Nesting a b)

-- Nesting is a type constructor (it is also fine to write that Nesting is an algebraic datatype)

-- S is a term constructor

depth (S (x,y)) = 0
depth (C (x,y)) = (max (depth x) (depth y)) + 1

smallerthans [] val = []
smallerthans (x:xs) val = if x < val then (x: (smallerthans xs val))
                                        else smallerthans xs val


isfun l = unique (vals l)
          where unique list = (nub list == list)
                vals asslist = map (\(x,v) -> x) asslist

