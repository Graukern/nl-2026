module Main where

add :: Int -> Int -> Int
add x y = x + y

square :: Int -> Int
square x = x * x

step :: (Int, Int) -> (Int, Int)
step (x,y) = (x + 1, y - 1)

isZero :: Int -> Bool
isZero x = x == 0

addTen :: Int -> Int
addTen = add 10

main :: IO ()
main = do
  print (add 2 3)
  print (square (add 2 3))
  print (step (2,3))
  print (isZero 0)
  print (isZero 5)
  print (addTen 5)
  print (map (add 10) [1,2,3])
