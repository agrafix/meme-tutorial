module MemeGen
    ( createMeme
    )
where

import qualified Data.ByteString as BS
import qualified Graphics.GD as GD

createMeme :: BS.ByteString -> String -> String -> IO BS.ByteString
createMeme imgBs upperText lowerText = undefined
