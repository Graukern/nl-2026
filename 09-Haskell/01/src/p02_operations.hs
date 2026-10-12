module Main where

main :: IO ()
main = do
  print (2 + 3 :: Int)
  print (2 * 3 :: Int)
  print (7 `div` 2 :: Int)
  print (7 `mod` 2 :: Int)
  print (7 / 2 :: Double)
  print (3 < 5 :: Bool)
  print (True && not False)
  print (0 : [1,2] :: [Int])
  print ([1,2] ++ [3] :: [Int])
