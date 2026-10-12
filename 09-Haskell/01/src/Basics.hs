module Basics where

-- Types and pure functions .
square :: Int -> Int
square x = x * x

add :: Int -> Int -> Int
add x y = x + y

addTen :: Int -> Int
addTen = add 10

half :: Int -> Double
half n = fromIntegral n / 2

-- Scope : inner binding shadows outer binding.
outer :: Int
outer = 10

scoped :: Int
scoped = let outer = 3
         in outer + 1

-- Conditions and pattern matching .
absolute :: Int -> Int
absolute x = if x < 0 then -x else x

signLabel :: Int -> String
signLabel x
  | x < 0 = "negative"
  | x == 0 = "zero"
  | otherwise = "positive"

describe :: [Int] -> String
describe []    = "empty"
describe [_]   = "one item"
describe (_:_) = "several items"

-- Recursion , for finite lists.
sumList :: [Int] -> Int
sumList []     = 0
sumList (x:xs) = x + sumList xs

-- Higher-order functions and a closure .
squaresOfEvens :: [Int] -> [Int]
squaresOfEvens xs = map square (filter even xs)

makeAdder :: Int -> (Int -> Int)
makeAdder n = \x -> n + x

-- Laziness . Never print all of naturals!
naturals :: [Integer]
naturals = [1..]

-- Local definitions and IO sequencing .
circleArea :: Double -> Double
circleArea r = pi * squared
  where
    squared = r * r

helloTwice :: IO ()
helloTwice = do
  putStrLn "Hello"
  putStrLn "Haskell"

