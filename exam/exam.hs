-- data Directory name = Dir name (Directory name) | File Integer String


-- wrapup [] = []
-- wrapup [x] = x : wrapup[]
-- wrapup(x:xs) = if x == head xs then x : wrapup xs else wrapup xs

-- list = [1,1,1,2,3,3,2]





-- increasing [] = True
-- increasing [x] = True
-- increasing (x:y:xs) = x < y && increasing (y:xs)

-- list1=[1,2,7,484000]
-- list2= ["ged","abe","hest"]



type Filespec = (String,Integer)
type Dirname = String 

data Directory = Subdir Dirname [Directory] [Filespec] | FlatDir Dirname [Filespec]

