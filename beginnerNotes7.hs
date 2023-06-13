import Control.Applicative (Applicative(liftA2))
main :: IO ()
main = do
    print "y"
    print ex01
    print ex02
    print ex03
    print ex04
    print ex05
    print ex06
    print ex15
    print ex16

-- monoids
-- instance Monoid [a] where
--     mempty = []
--     mappend = (++)

-- functors
-- class FunctorX f where
--     fmap :: (a -> b) -> f a -> f b

-- instance FunctorX Maybe where
--     fmap :: (a -> b) -> Maybe a -> Maybe b
--     fmap _ Nothing = Nothing
--     fmap h (Just a) = Just (h a)

-- instance FunctorX [] where
--     fmap _ [] = []
--     fmap f (x:nx) = f x : fmap f nx

-- thingMap :: (a -> b) -> f a -> f b
-- thingMap h fa = ???

type Name = String

data Employee = Employee {
    name :: Name,
    phone :: String
}
    deriving Show

-- fmap2 :: Functor f => (a -> b -> c) -> (f a -> f b -> f c)
-- fmap2 h fa fb = undefined

-- <*> is apply
-- class Functor f => Applicative f where
--     pure :: a -> f a
--     (<*>) :: f (a -> b) -> f a -> f b

-- (<$>) :: Functor f => (a -> b) -> f a -> f b
-- (<$>) = fmap

m_name1, m_name2 :: Maybe Name
m_name1 = Nothing
m_name2 = Just "Brent"

m_phone1, m_phone2 :: Maybe String
m_phone1 = Nothing
m_phone2 = Just "555-1234"

ex01 :: Maybe Employee
ex01 = Employee <$> m_name1 <*> m_phone1
ex02 :: Maybe Employee
ex02 = Employee <$> m_name1 <*> m_phone2
ex03 :: Maybe Employee
ex03 = Employee <$> m_name2 <*> m_phone1
ex04 :: Maybe Employee
ex04 = Employee <$> m_name2 <*> m_phone2

ex05 :: [[Integer]]
ex05 = fmap (replicate 3) [1,2,3,4]
ex06 :: Maybe [Integer]
ex06 = fmap (replicate 3) (Just 4)
ex07 :: Maybe [a]
ex07 = fmap (replicate 3) Nothing
ex08 :: Either String [a]
ex08 = fmap (replicate 3) (Left "foo")
ex09 :: Either a [String]
ex09 = fmap (replicate 3) (Right "blah")

ex10 :: Maybe Integer
ex10 = fmap id (Just 3)
ex11 :: Maybe Integer
ex11 = id (Just 3)
ex12 :: [Integer]
ex12 = fmap id [1..5] 
ex13 :: [b]
ex13 = fmap id []
ex14 :: Maybe b
ex14 = fmap id Nothing 

-- second functor law...
data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
    fmap :: (a -> b) -> CMaybe a -> CMaybe b
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter+1) (f x)

ex15 :: CMaybe String
ex15 = fmap id (CJust 0 "haha") -- CJustt 1 "haha"
ex16 :: CMaybe String
ex16 = id (CJust 0 "haha") -- CJust 0 "haha" -- doesn't obey functor laws

-- The first functor law states that if we map the id function over a functor, the functor that we get back should be the same as the original functor.
-- The second law says that composing two functions and then mapping the resulting function over a functor should be the same as first mapping one function over the functor and then mapping the other one.
-- Source: http://learnyouahaskell.com/functors-applicative-functors-and-monoids#functors-redux


-- liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c  
ex17 :: Maybe [Integer]
ex17 = liftA2 (:) (Just 3) (Just [4]) 

-- bind function symbol: (>>=) :: (Monad m) => m a -> (a -> m b) -> m b -- Monad takes a context value, changes to a value and returns a new context value

