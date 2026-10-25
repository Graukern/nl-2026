module Main where
process :: [Int] -> Int
process = sum . map (*2) . filter even
main :: IO ()
main = print (process [1..10])
