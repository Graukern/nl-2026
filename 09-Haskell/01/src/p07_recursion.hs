module Main where

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

count :: [a] -> Int
count [] = 0
count (_:xs) = 1 + count xs

main :: IO ()
main = do
  print (sumList [])
  print (sumList [2,3,4])
  print (sumList [-2,2])
  print (count ([] :: [Int]))
  print (count [2,3,4 :: Int])
