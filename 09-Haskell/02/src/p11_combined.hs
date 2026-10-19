module Main where
import qualified Data.Map.Strict as M
data LookupError = UnknownKey String deriving (Eq, Show)
findValue :: String -> M.Map String Int -> Either LookupError Int
findValue key table = case M.lookup key table of
  Nothing -> Left (UnknownKey key)
  Just n -> Right n
main :: IO ()
main = do
  let table = M.fromList [("a",1)]
  print (findValue "a" table)
  print (findValue "z" table)
