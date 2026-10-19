module Main where
import Control.Exception (AssertionFailed, assert, evaluate, try)
import Debug.Trace (trace)
checked :: Int -> Int
checked n = assert (n >= 0) (n + 1)
doubled :: Int -> Int
doubled n = trace "doubling" (n * 2)
main :: IO ()
main = do
  print (checked 3)
  result <- try (evaluate (checked (-1))) :: IO (Either AssertionFailed Int)
  putStrLn (either (const "assertion caught") show result)
  print (doubled 4)
