module Player
    (
        player_command
    ) where

import Utility

player_command :: String -> [String] -> IO ()
player_command c ps = message Debug ("Player command '" ++ c ++ "' called with params '" ++ list_params ++ "'")
    where list_params = foldr1 (\x y-> (x ++ "', '" ++ y)) ps
player_command _ _ = message Normal "No such command."

