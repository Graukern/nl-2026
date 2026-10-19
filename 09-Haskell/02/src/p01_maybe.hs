module Main where
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x
main :: IO ()
main = do
  print (safeHead ([3,4] :: [Int]))
  print (safeHead ([] :: [Int]))
  print (maybe 0 (+1) (Just 5) :: Int)
  print (maybe 0 (+1) Nothing :: Int)
