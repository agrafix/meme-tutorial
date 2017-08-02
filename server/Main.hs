{-# LANGUAGE OverloadedStrings #-}
module Main where

-- import MemeGen (createMeme)

-- import Control.Monad.Trans
import Lucid
-- import Network.HTTP.Types.Status
import System.Environment
import Web.Spock.Core
-- import Web.Spock.Lucid
-- import qualified Data.ByteString as BS
-- import qualified Data.HashMap.Strict as HM

main :: IO ()
main =
    do args <- getArgs
       case args of
         [port] ->
             runSpock (read port) (spockT id app)
         _ ->
             putStrLn "Usage: ./"

app :: SpockT IO ()
app = pure () -- define your routing here

homeView :: Html ()
homeView =
    doctypehtml_ $
    do head_ $
           title_ "MemeGen"
       body_ $ h1_ "Welcome to MemeGen"

homeSite :: ActionT IO ()
homeSite = undefined

downloadMeme :: ActionT IO ()
downloadMeme = undefined
