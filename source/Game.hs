module Game
    (
        game_command
    ) where

import Utility
import Creature
import Stats
import ID

game_command :: String -> [String] -> IO ()
game_command c ps = message Debug ("Game command '" ++ c ++ "' called with params '" ++ list_params ++ "'")
    where list_params = foldr1 (\x y-> (x ++ "', '" ++ y)) ps
game_command _ _ = message Game "No such command." 





player = Creature
    {
        cID = CreatureID 1
      , cBaseStats = Stats
        {
            stClass = Novice
          , stBaseLevel = 5
          , stJobLevel = 1
          , stRace = Demihuman
          , stProperty = Neutral
          , stSize = Medium
          , stStr = 10
          , stAgi = 10
          , stVit = 1
          , stInt = 1
          , stDex = 20
          , stLuk = 1
          , stSpeed = 100 
          , stDef = 0
          , stMDef = 0
          , stAtkRange = 1
          , stSpellRange = 10
          , stSightRange = 14
          , stBaseExp = 300
          , stJobExp = 0
          , stHealth = 0
          , stMana = 0
          , stFlee = 0
          , stHit = 0
          , stAspd = 0
          , stMinAtk = 0
          , stMaxAtk = 0
          , stFixedAtk = 0
          , stMinMatk = 0
          , stMaxMatk = 0
        }
      , cModStats = Stats
        {
            stClass = Novice -- unused
          , stBaseLevel = 5 -- unused
          , stJobLevel = 1 -- unused
          , stRace = Demihuman -- unused
          , stProperty = Neutral -- unused
          , stSize = Medium -- unused
          , stStr = 0
          , stAgi = 0
          , stVit = 0
          , stInt = 0
          , stDex = 0
          , stLuk = 0
          , stSpeed = 0 
          , stDef = 0
          , stMDef = 0
          , stAtkRange = 0
          , stSpellRange = 0
          , stSightRange = 0
          , stBaseExp = 300 -- unused
          , stJobExp = 0 -- unused
          , stHealth = 0
          , stMana = 0
          , stFlee = 0
          , stHit = 0
          , stAspd = 0
          , stMinAtk = 0
          , stMaxAtk = 0
          , stFixedAtk = 0
          , stMinMatk = 0
          , stMaxMatk = 0
        }
      , cSkills = []
    }    
