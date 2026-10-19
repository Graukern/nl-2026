module Main where
data DivError = ZeroDivisor deriving (Eq, Show)
safeDiv :: Integer -> Integer -> Either DivError Integer
safeDiv _ 0 = Left ZeroDivisor
safeDiv x y = Right (x `div` y)
main :: IO ()
main = do
  print (safeDiv 10 2)
  print (safeDiv 10 0)
  putStrLn (either show show (safeDiv 10 0))
