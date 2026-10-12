module Main where

main :: IO ()
main = do
  let xs = [1,2,3] :: [Int]
      ys = 0 : xs
  print xs
  print ys
  print (sum xs)
  print xs
  print (map (+1) xs)
  print xs
