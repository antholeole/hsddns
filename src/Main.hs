module Main where

import qualified Message

main :: IO ()
main = do
    putTextLn $ Message.stuff "s"
