module PlayerCommands
    (
        player_command
    ) where

import Utility
import Game
import TestSkills

player_command :: String -> [String] -> GameAction ()
--player_command c ps = message Debug ("Player command '" ++ c ++ "' called with params '" ++ list_params ++ "'")
--    where list_params = foldr1 (\x y-> (x ++ "', '" ++ y)) ps
player_command "heal" (level:_) = useSkill (healAction $ read level) Game.player Game.player >> return ()
player_command "bash" (level:_) = useSkill (bashAction $ read level) Game.player Game.player >> return ()
player_command _ _ = liftIO $ message Normal "No such command."

