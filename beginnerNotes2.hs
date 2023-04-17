{-
negative numbers have to be wrapped in parentheses (-x)
-}
main :: IO ()
main = do
    putStrLn "well"
    let x = sumtorial 3
        y = sumtorial 0
        z = [foo 0, foo 1, foo (-3), foo 0, foo 1, foo 36, foo 38]
    print x
    print y
    print z
    print ex1
    print p
    print x1
    print x2
    print x3

-- function that is like factorial
-- | symbol is a guard which is like || hence (n == 0 || n > 0), order of guards matters since it will return the first true expression, like a switch statement use otherwise to give a default when nothing can be matched.
-- if expressions require else if used
sumtorial :: Integer -> Integer
sumtorial n
    | n == 0 = 0
    | n > 6 = n + sumtorial (n-1)
    | otherwise = 1

foo :: Integer -> Integer
foo 0 = 16
foo 1 
  | "Haskell" > "C++" = 3
  | otherwise         = 4
foo n
  | n < 0            = 0
  | n `mod` 17 == 2  = -43
  | otherwise        = n + 3

p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x,y) = x + y
ex1 = sumPair (5,3)

nums, range, range2 :: [Integer]
nums   = [1,2,3,19]
range  = [1..100]
range2 = [2,4..100]

hello1 :: [Char]
hello1 = ['h', 'e', 'l', 'l', 'o']

hello2 :: String
hello2 = "hello"

-- cons operator (:) Cons takes an element and a list, and produces a new list with the element prepended to the front.
emptyList :: [a]
emptyList = []
x1 = 1 : []
x2 = 3 : (1 :[])
x3 = 2 : 3 : 4 : []