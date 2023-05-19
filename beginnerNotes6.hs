main :: IO ()
main = do
    print "y"

-- parametric polymorphism
f1 :: a -> a -> a
f1 x y = x

f2 :: a -> a -> a
f2 x y = y

-- type classes
class Listable a where
    toList :: a -> [Int]

instance Listable Int where
    toList :: Int -> [Int]
    toList x = [x]

instance Listable Bool where
    toList :: Bool -> [Int]
    toList True = [1]
    toList False = [0]

instance Listable [Int] where
    toList :: [Int] -> [Int]
    toList = id

data Tree a = Empty | Node a (Tree a) (Tree a)

instance Listable (Tree Int) where
    toList :: Tree Int -> [Int]
    toList Empty = []
    toList (Node x l r) = toList l ++ [x] ++ toList r
    