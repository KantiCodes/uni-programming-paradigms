data Box a = Blue a |  Red (Box a,Box a) deriving Show

mybox = Red ( Red (Blue True, Blue False), Red ( Red ( Blue True, Blue True), Red ( Red (Blue True, Blue True), Red (Blue True, Blue True))))

samey (Blue x) = False
samey (Red (Blue x,Blue y)) = x == y
samey (Red (box1,box2)) = samey box1 && samey box2

--The type of this function involves both ad hoc polymorphism (because of the type class Eq) and
--parametric polymorphism.

nestinglevel (Blue x) = 0
nestinglevel (Red (box1,box2)) = let level1 = nestinglevel box1
                                     level2 = nestinglevel box2
                                 in
                                       (max level1 level2)  + 1

--The type of this function involves ad hoc polymorphism (because of the type classes Num and Ord) and parametric polymorphism, 
--as a is not constrained to any particular type class.


-- Infinite list of cubes
cubes = [ x*x*x | x <- [1..] ]

icr n = head [ x | x <- [1..n], x*x*x <= n, (x+1)*(x*1)*(x+1) > n ]

sumcubes n = foldr (+) 0 (take n cubes)

