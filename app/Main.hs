module Main where

import MemeGen
import System.Environment
import System.Exit
import Control.Monad
import qualified Data.ByteString as BS

main :: IO ()
main =
    do args <- getArgs
       when ("--help" `elem` args) usage
       case args of
         [img, upperText, lowerText, out] ->
             do bs <- BS.readFile img
                resultBs <- createMeme bs upperText lowerText
                BS.writeFile out resultBs
         _ -> usage
    where
      usage =
          do putStrLn "USAGE: memegen INPUT_IMAGE.jpg UPPER_TEXT LOWER_TEXT OUTPUT_IMAGE.jpg"
             exitWith (ExitFailure 1)
