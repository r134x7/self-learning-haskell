-- reminder: runghc filename to run
-- can declare types separately to variable names
{-
IO () - type that produces the side effect to print to the screen 
putStrLn :: String -> IO () ; prints string and then apply new line
print :: forall a. Show a => a -> IO ()
Important: use print when you want to output any value to string

-}
-- :: has type
-- >> and then
-- >>= bind
main :: IO ()
main = do
    -- putStrLn "Write a word or not."
    -- line <- getLine
    -- if null line
    --     then return ()
    --     else do
    --         putStrLn (reverseWords line)
    putStrLn "Hello, World!"
    print ex17
    let x = hailstone 3
        y = isEven 9
        x1 = hailstoneSeq 1
        x2 = hailstoneSeq 4
    print x
    print y
    print x1
    print x2
    -- putStrLn "Enter a number: " >> (readLn >>= (\n -> print (n+1)))
    -- putStrLn "Hello, what's your name?"  
    -- name <- getLine  
    -- putStrLn ("Hey " ++ name ++ ", you rock!") 

-- sumtorial :: Integer -> Integer
-- sumtorial 0 = 0
-- sumtorial n = n + sumtorial (n-1)

hailstone :: Integer -> Integer
hailstone n
    | even n = n `div` 2
    | otherwise      = 3*n + 1

hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

isEven :: Integer -> Bool
isEven n
  | even n = True
  | otherwise = False

f :: Int -> Int -> Int -> Int
f x y z = x + y + z
ex17 = f 3 17 8

reverseWords :: String -> String
reverseWords = unwords . map reverse . words