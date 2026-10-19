module Main where

makeAdder :: Int -> (Int -> Int)
makeAdder n = \x -> n + x

main :: IO ()
main = do
  let addTen = makeAdder 10
      addHundred = makeAdder 100
  print (addTen 5)
  print (addHundred 5)
  print (map addTen [1,2,3])
  print (map (\x -> x * 2) [1,2,3 :: Int])
