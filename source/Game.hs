module Game
    (
        game_command
    ) where

import Utility

game_command :: String -> [String] -> IO ()
game_command c ps = message Debug ("Game command '" ++ c ++ "' called with params '" ++ list_params ++ "'")
    where list_params = foldr1 (\x y-> (x ++ "', '" ++ y)) ps
game_command _ _ = message Game "No such command." 

