{-# LANGUAGE BangPatterns #-}
module Main where
import Data.List (foldl')
total :: [Int] -> Int
total = foldl' (+) 0
count :: [a] -> Int
count = go 0
  where
    go !n [] = n
    go !n (_:xs) = go (n+1) xs
main :: IO ()
main = do
  print (total [1..100000])
  print (count [1..100000 :: Int])
