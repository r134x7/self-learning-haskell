main :: IO ()
main = do
    print "y"

-- gt100 :: Integer -> Bool
-- gt100 valueInput = valueInput > 100

-- greaterThan100 :: [Integer] -> [Integer]
-- greaterThan100 valueInput = filter gt100 valueInput

-- using a lambda expression
greaterThan100v2 :: [Integer] -> [Integer]
greaterThan100v2 yValue = filter (\xValue -> xValue > 100) yValue

greaterThan100v3 :: [Integer] -> [Integer]
greaterThan100v3 = filter (>100)

-- (b -> c) -> (a -> b) -> (a -> c)
-- function composition
foo :: (b -> c) -> (a -> b) -> (a -> c)
foo f g xValue = f (g xValue)

-- one function composition method
testFun :: [Integer] -> Bool
testFun x = even (length (greaterThan100v3 x))

-- the other function composition method
-- This looks much more readable, a reminder that just like in JavaScript composition above, the functions read from right to left for order of execution
testFun' :: [Integer] -> Bool
testFun' = even . length . greaterThan100v3

exampleFun :: Int -> Int -> Int
exampleFun x y = 2*x + y

-- use a tuple (x, y) to create a multi-argument function
tupleIt :: (Int, Int) -> Int
tupleIt (x, y) = 2*x + y

-- to uncurry a function
unSum :: (Int, Int) -> Int
unSum (x,y) = (+) x y

-- "Wholemeal" programming
foobar :: [Integer] -> Integer
foobar [] = 0
foobar (x:nx)
    | x > 3 = (7*x + 2) + foobar nx
    | otherwise = foobar nx

-- remember, function composition starts from right to left
foobar' :: [Integer] -> Integer
foobar' = sum . map (\x -> 7*x + 2) . filter (>3)
