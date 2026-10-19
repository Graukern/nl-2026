module Main where
import Lecture.Safe (safeHead)
import Lecture.Money (mkMoney, amount)
main :: IO ()
main = do
  print (safeHead ([3,4] :: [Int]))
  print (fmap amount (mkMoney 12))
  print (fmap amount (mkMoney (-1)))
