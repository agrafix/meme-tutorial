module Main where

import Control.Monad
-- import MemeGen
import System.Environment
import System.Exit
-- import qualified Data.ByteString as BS

main :: IO ()
main =
    do args <- getArgs
       when ("--help" `elem` args) usage
       case args of
         _ -> undefined
    where
      usage =
          do putStrLn "USAGE: memegen INPUT_IMAGE.jpg UPPER_TEXT LOWER_TEXT OUTPUT_IMAGE.jpg"
             exitWith (ExitFailure 1)
