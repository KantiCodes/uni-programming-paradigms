type Filespec = (String,Integer)
type Dirname = String 

data Directory = Subdir Dirname [Directory] [Filespec] | FlatDir Dirname [Filespec] deriving Show 

myDir = FlatDir ("test") ([("File", 64),("File2", 128)])

myDir2 = Subdir("test2") ([FlatDir ("subdir2") ([("SubFile123", 256)])]) ([("File", 64), ("File2", 256)])

getSize [] = 0
getSize ((name, val): xs) = val + getSize xs

sizes lst = map (\(x,y)-> y) lst
size' lst = foldr (+) 0 lst

size (FlatDir d filelist) = let fileSizes = sizes filelist in size' fileSizes
--size (Subdir d dirList fList) = getSize fList + foldr (size) 0 dirList

square x = let y = 2 in x * y

resu = foldr (+) 1 [1,2,3,4]