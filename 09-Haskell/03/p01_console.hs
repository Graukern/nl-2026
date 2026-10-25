module Main where
import System.IO (hPutStrLn, stderr)
greet :: String -> String
greet name = "Hello, " ++ name
main :: IO ()
main = do
  name <- getLine
  putStrLn (greet name)
  print (length name)
  hPutStrLn stderr "done"
