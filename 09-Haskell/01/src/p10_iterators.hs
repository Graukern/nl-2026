module Main where
import Control.Monad (forM_)

square :: Int -> Int
square x = x * x

naturals :: [Integer]
naturals = [1..]

main :: IO ()
main = do
  print (map square [1,2,3])
  print (filter even [1..6 :: Int])
  print (map square (filter even [1..6]))
  print (foldr (+) 0 [2,3,4 :: Int])
  print (foldr (*) 1 [2,3,4 :: Int])
  print (take 5 naturals)
  print (take 3 (map square [1..]))
  forM_ [1..3 :: Int] print
