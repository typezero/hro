module GameCommands
    (
      game_command
    ) where

import Utility
import Game

game_command :: String -> [String] -> GameAction ()
--game_command c ps = message Debug ("Game command '" ++ c ++ "' called with params '" ++ list_params ++ "'")
--    where list_params = foldr1 (\x y-> (x ++ "', '" ++ y)) ps
game_command "stat" _ = renderPlayerStats
game_command _ _ = liftIO $ message Game "No such command."

