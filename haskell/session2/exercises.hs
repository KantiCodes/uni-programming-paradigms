
-- Problem 1
divisors' n = [i | i <- [1..n], (mod n i) == 0]

isprime :: (Integral a) => a -> Bool
isprime 1 = True
isprime 2 = True
isprime n = 2 == (length (divisors' n))

-- Problem 2

data Nat = Succ Nat | Zero deriving (Show)
nat2int :: (Num p) => Nat -> p
nat2int Zero = 0
nat2int (Succ x) = 1 + nat2int x

zero = Zero
one = Succ(Zero)
two = Succ(Succ(Zero))

int2nat 0 = Zero
int2nat n = Succ(int2nat(n - 1))
zero_nat = int2nat 0
one_nat = int2nat 1
seven_nat = int2nat 7

-- Problem 3
ones = [1] ++ ones

nseq s1 s2 = s1 : nseq s2 (s1+s2)
fibs = nseq 0 1
fib n = head (drop n fibs) -- To get the (car '(n, n+1...))

-- Problem 4
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)
root = Leaf 1
binary123 = Node (Leaf 5) (Leaf 6)


nodes (Leaf a) = 1
nodes (Node l r) = nodes l + nodes r
balanced :: Tree a -> Bool
balanced (Leaf a) = True
balanced (Node l r) =  abs(n1-n2) <= 1 
                        where
                            n1 = nodes l
                            n2 = nodes r

balanced_tree =  Node (Node (Leaf 122) (Leaf 2222)) (Leaf 33)

-- Problem 5 

odd' x = ((x mod 2) == 1)

any' [] p = False
any' (x:xs) p = if p x then True else any' xs p

thehead (x:xs) = x

my_op val = (2 * val)
some_func op = \x -> op x

any'' pred = foldr (\x -> \y ->  (pred x) || y)
foldr (||) False [True] 

