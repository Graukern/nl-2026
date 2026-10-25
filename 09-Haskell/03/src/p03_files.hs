module Main where
import System.IO
import Control.Exception (evaluate)
import System.Directory (removeFile)
main :: IO ()
main = do
  let path = "haskell03-demo.txt"
  writeFile path "one\n"
  appendFile path "two\n"
  withFile path ReadMode $ \h -> do
    hSetEncoding h utf8
    hGetLine h >>= putStrLn
  n <- withFile path ReadMode $ \h -> do
    text <- hGetContents h
    evaluate (length text)
  print n
  removeFile path
