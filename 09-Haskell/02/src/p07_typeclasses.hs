module Main where
data Status = New | Done deriving (Eq, Ord, Show)
class Describable a where
  describe :: a -> String
instance Describable Status where
  describe New = "new"
  describe Done = "done"
label :: Describable a => a -> String
label x = "status: " ++ describe x
maximumMaybe :: Ord a => [a] -> Maybe a
maximumMaybe [] = Nothing
maximumMaybe xs = Just (maximum xs)
main :: IO ()
main = do
  print (New < Done)
  putStrLn (label Done)
  print (map describe [New, Done])
  print (maximumMaybe ([3,1,8] :: [Int]))
  print (maximumMaybe ([] :: [Int]))
