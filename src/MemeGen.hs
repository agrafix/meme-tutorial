module MemeGen
    ( createMeme
    )
where

import qualified Data.ByteString as BS
-- import qualified Graphics.GD as GD

createMeme :: BS.ByteString -> String -> String -> IO BS.ByteString
createMeme _imgBs _upperText _lowerText = undefined
