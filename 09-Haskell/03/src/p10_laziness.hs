module Main where
import Control.DeepSeq (deepseq)
import Control.Exception (ErrorCall, evaluate, try)
main :: IO ()
main = do
  print (take 5 [1..] :: [Int])
  print (const 7 (error "unused") :: Int)
  print ([undefined :: Int] `seq` (7 :: Int))
  result <- try (evaluate ([undefined :: Int] `deepseq` (7 :: Int)))
    :: IO (Either ErrorCall Int)
  putStrLn (either (const "deep evaluation failed") show result)
