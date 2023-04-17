-- can declare types separately to variable names
{-
IO () - type that produces the side effect to print to the screen 
putStrLn :: String -> IO () ; prints string and then apply new line
-}
main :: IO ()
main = putStrLn "Hello, World!"