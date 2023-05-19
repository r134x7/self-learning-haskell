main :: IO ()
main = do
    putStrLn "Thing"
    print [x1, x2]
    let y1 = safeDiv 2 0
        y2 = safeDiv 2 2
        y3 = safeDiv 0 2
    print "y"
    print [y1, y2, y3]
    let z1 = failureToZero Failure 
        z2 = failureToZero (OK 5)
        z3 = failureToZero (OK 0)
    print "z"
    print [z1, z2, z3]
    let a1 = getAge stan
    print a1
    print [stan, brent]
    let b1 = baz brent
    print b1
    let b2 = checkFav brent
    let b3 = checkFav stan
    print [b2, b3]

-- enumeration, deriving Show converts the enumerators to Strings
data Thing where
  Shoe :: Thing
  Ship :: Thing
  SealingWax :: Thing
  Cabbage :: Thing
  King :: Thing
  deriving Show

-- algebraic data type
data FailableDouble = Failure
        | OK Double
    deriving Show

x1 :: FailableDouble
x1 = Failure
x2 :: FailableDouble
x2 = OK 3.4

-- pattern-matching, if second parameter is 0 then Failure else OK, underscore _ values are wildcards which match any value
safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

-- more pattern-matching
failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d) = d

-- Store data...
data Person = Person String Int Thing
    deriving Show

brent :: Person
brent = Person "Brent" 31 SealingWax

stan :: Person
stan = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a

baz :: Person -> String
baz p@(Person n _ _) = "The name field of (" ++ show p ++ ") is " ++ n

checkFav :: Person -> String
checkFav (Person n _ SealingWax) = n ++ ", you're my kind of person!"
checkFav (Person n _ _) = n ++ ", your favourite thing is lame."

-- case expressions
ex03 = case "Hello" of
    []      -> 3
    ('H':s) -> length s
    _       -> 7

data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x l) = x * intListProd l

data Tree = Leaf Char
        | Node Tree Int Tree
    deriving Show

tree :: Tree
tree = Node (Leaf 'x') 1 (Leaf 'z')