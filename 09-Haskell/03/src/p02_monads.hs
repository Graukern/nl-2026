module Main where
half :: Int -> Maybe Int
half n | even n = Just (n `div` 2)
       | otherwise = Nothing
quarter :: Int -> Maybe Int
quarter n = do
  x <- half n
  half x
main :: IO ()
main = do
  print (quarter 8)
  print (quarter 6)
  print (pure 5 :: Maybe Int)
