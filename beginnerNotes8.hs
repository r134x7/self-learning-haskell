main :: IO ()
main = do
    print "y"
    print ex01

-- Source: https://www.haskell.org/tutorial/goodies.html

-- recursive types
-- tree is a type constructor, leaf and branch are data constructors (values)
data Tree a = Leaf a | Branch (Tree a) (Tree a)

-- ++ operator is concat
fringe :: Tree a -> [a]
fringe (Leaf x) = [x]
fringe (Branch left right) = fringe left ++ fringe right

-- list comprehension [ f x | x <- xs ]
-- "the list of all f x such that x is drawn from xs"
-- x <- xs is a generator, xs is plural of x

-- second condition reads as... calling quicksort recursively the list of y (sorted list) such that y is drawn from xs on the condition that y < x, concatenate the list with the single x value from the list of xs, concatenate the list with the recursively called quicksort list of y... where the condition is that the list y of is greater than or equal to x 
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y < x]
    ++ [x]
    ++ quicksort [y | y <- xs, y >= x]

ex01 = quicksort [5,2,8,1]