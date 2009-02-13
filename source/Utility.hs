module Utility
    (
        message,
        MessageType(..)
    ) where

import Render

data MessageType = Normal | Game | System | Debug | Warning | Error

message :: MessageType -> String -> IO ()
message t s = do
    putDoc $ message_color t (text s) <> linebreak

message_color :: MessageType -> Doc -> Doc
message_color t = 
    case t of
        Normal  -> white
        Game -> green
        System -> cyan
        Debug -> magenta
        Warning -> yellow
        Error   -> red
