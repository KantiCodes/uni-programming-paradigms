data SimpleType = Int | Multi SimpleType SimpleType | Arrow SimpleType SimpleType deriving (Show)
int2int = Arrow Int Int