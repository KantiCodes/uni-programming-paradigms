import Prelude

threes :: (Integral a) => [a]
threes = [i | i <- [0..], i `mod` 3 == 0]

threes' = [3*i | i <- [0..]]
fours = [4*i | i <- [0..10]]

sequence' n k = n : (sequence' (n+k) k)

threes'' = sequence' 0 3

a = take 5 threes
-- Matryoshka dolls as an algebraic datatype

data Doll = Shell Doll | Infant

size :: Doll -> Int
size (Infant) = 1
size (Shell d) = 1 + size d

-- For easier testing of the size function

my_dolls = Shell (Shell (Shell (Shell (Infant))))

-- Boolean expressions as an algebraic datatype

data Bexp = TT | FF | Or Bexp Bexp | And Bexp Bexp | Neg Bexp

mybexp :: Bexp
mybexp = And (Or TT TT) (Or FF (And FF TT))

eval :: Bexp -> Bool
eval TT = True
eval FF = False
eval (Or b1 b2) = v1 || v2
                  where v1 = eval b1
                        v2 = eval b2
eval (And b1 b2) = v1 && v2
                  where v1 = eval b1
                        v2 = eval b2
eval (Neg b) = not v
               where v = eval b

-- squares using an infinite range

squares n = take n [i*i | i <- [0..]]

-- squares using a finite range

squares' n = [i*i | i <- [0..n]]

-- FOLD S R + R

-- Explanation of why does it work like that is here https://gist.github.com/CMCDragonkai/9f5f75118dda10131764
aaaa = foldr (/) 2 [2,4,8]
bbbb = foldl (/) 2 [2,4,8]

xa =  (2 / (4 / (8/2)))
xb = (2/2)/4/8