{-# LANGUAGE OverloadedStrings #-}
module Main where

import MemeGen (createMeme)

import Control.Monad.Trans
import Lucid
import Network.HTTP.Types.Status
import System.Environment
import Web.Spock.Core
import Web.Spock.Lucid
import qualified Data.ByteString as BS
import qualified Data.HashMap.Strict as HM

main :: IO ()
main =
    do args <- getArgs
       case args of
         [port] ->
             runSpock (read port) (spockT id app)
         _ ->
             putStrLn "Usage: ./"

app :: SpockT IO ()
app =
    do get "/" homeSite
       post "/meme" downloadMeme


homeView :: Html ()
homeView =
    doctypehtml_ $
    do head_ $
           title_ "MemeGen"
       body_ $
           do h1_ "Welcome to MemeGen"
              form_
                  [ action_ "/meme"
                  , method_ "post"
                  , enctype_ "multipart/form-data"
                  ] $
                  do input_
                         [ type_ "text"
                         , name_ "firstline"
                         , placeholder_ "First Line"
                         ]
                     br_ []
                     input_
                         [ type_ "text"
                         , name_ "secondline"
                         , placeholder_ "Second Line"
                         ]
                     br_ []
                     input_
                         [ type_ "file"
                         , name_ "file"
                         ]
                     br_ []
                     input_
                         [ type_ "submit"
                         , value_ "Create the meme!"
                         ]

homeSite :: ActionT IO ()
homeSite =
    lucid homeView


downloadMeme :: ActionT IO ()
downloadMeme =
    do fl <- param' "firstline"
       sl <- param' "secondline"
       upFile <-
           HM.lookup "file" <$> files
       case upFile of
         Nothing ->
             do setStatus status500
                text "Missing uploaded file!"
         Just uploadedFile ->
             do bs <- liftIO (BS.readFile $ uf_tempLocation uploadedFile)
                meme <- liftIO (createMeme bs fl sl)
                setHeader "Content-Type" (uf_contentType uploadedFile)
                bytes meme
