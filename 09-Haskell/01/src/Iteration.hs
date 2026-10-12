module Main where
import Control.Monad (forM_)

main :: IO ()
main = forM_ [1..3] print
