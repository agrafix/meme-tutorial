module MemeGen
    ( createMeme
    )
where

import qualified Graphics.GD as GD
import qualified Data.ByteString as BS

textColor :: GD.Color
textColor = GD.rgb 255 255 255

textSize :: Double
textSize = 32.0

createMeme :: BS.ByteString -> String -> String -> IO BS.ByteString
createMeme imgBs upperText lowerText =
    do img <- GD.loadJpegByteString imgBs
       (imgW, imgH) <- GD.imageSize img
       _ <- GD.useFontConfig True
       drawText img imgW upperText (\textH -> textH + 10)
       drawText img imgW lowerText (\_ -> imgH -20)
       GD.saveJpegByteString 100 img
    where
      drawText img imgW txt offset =
          do (_, (lrx, lry), _, (ulx, uly))
                 <- GD.measureString "sans" textSize 0.0 (0, 0) txt textColor
             let (textW, textH) = (1 + lrx - ulx, 1 + lry - uly)
                 pos = (imgW `div` 2 - textW `div` 2, offset textH)
             _ <- GD.drawString "sans" textSize 0.0 pos txt textColor img
             return ()
