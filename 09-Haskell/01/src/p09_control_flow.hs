module Main where

absolute :: Int -> Int
absolute x = if x < 0 then -x else x

signLabel :: Int -> String
signLabel x
  | x < 0 = "negative"
  | x == 0 = "zero"
  | otherwise = "positive"

describe :: [Int] -> String
describe [] = "empty"
describe [_] = "one item"
describe (_:_) = "several items"

firstOrZero :: [Int] -> Int
firstOrZero xs = case xs of
  [] -> 0
  x:_ -> x

main :: IO ()
main = do
  print (absolute (-7))
  mapM_ (putStrLn . signLabel) [-3,0,4]
  mapM_ (putStrLn . describe) [[],[1],[1,2]]
  print (firstOrZero [])
  print (firstOrZero [5,6])
