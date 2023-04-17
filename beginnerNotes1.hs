-- can declare types separately to variable names
{-
IO () - type that produces the side effect to print to the screen 
putStrLn :: String -> IO () ; prints string and then apply new line
-}
-- :: has type
-- >> and then
-- >>= bind
main :: IO ()
main = do
    putStrLn "Hello, World!"
    putStrLn "Enter a number: " >> (readLn >>= (\n -> print (n+1)))

