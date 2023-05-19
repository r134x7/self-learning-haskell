main :: IO()
main = do
    print "well..."

data IntList = Empty | Cons Int IntList
    deriving Show

absAll :: IntList -> IntList
absAll Empty = Empty
absAll (Cons x xs) = Cons (abs x) (absAll xs)

exampleList = Cons (-1) (Cons 2 (Cons (-6) Empty))

addOne x = x + 1
square x = x * x

-- mapIntList addOne exampleList
-- mapIntList abs exampleList
-- mapIntList square exampleList

-- polymorphic data types, t is a type variable standing for any type
-- C and E are constructors
data List t = E | C t (List t)

lst1 :: List Int
lst1 = C 3 (C 5 (C 2 E))

lst2 :: List Char
lst2 = C 'x' (C 'y' (C 'z' E))

lst3 :: List Bool
lst3 = C True (C False E)

-- for any type t, filterList takes a function for t to Bool, and a list of t's, and returns a list of t's
filterList :: (t -> Bool) -> List t -> List t
filterList _ E = E
filterList p (C x xs)
    | p x = C x (filterList p xs)
    | otherwise = filterList p xs

mapList :: (a -> b) -> List a -> List b
mapList _ E     = E
mapList f (C x xs) = C (f x) (mapList f xs)

-- doStuff1 :: [Int] -> Int
-- doStuff1 [] = 0
-- doStuff1 [_] = 0
-- doStuff1 xs = head xs + (head (tail xs))

doStuff2 :: [Int] -> Int
doStuff2 [] = 0
doStuff2 [_] = 0
doStuff2 (x1:x2:_) = x1 + x2

data Maybe a = Nothing | Just a

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x