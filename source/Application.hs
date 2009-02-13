module Application
  (
    run
  ) where

import Utility
import GameCommands
import PlayerCommands
import Game
import Control.Monad (when)

-------------------------------------------------------
-- TEST CODE
------------------
import Creature
import ID
import Stats
import SkillDSL
import TestSkills

testPlayer = Creature
    {
      cID = CreatureID 0
    , cName = "Player"
    , cBaseStats = BaseStats
      {
        bsClass      = Acolyte
      , bsBaseLevel  = 23
      , bsJobLevel   = 16
      , bsRace       = Demihuman
      , bsProperty   = Neutral
      , bsSize       = Medium
      , bsStr        = 1
      , bsAgi        = 1
      , bsVit        = 1
      , bsInt        = 54
      , bsDex        = 20
      , bsLuk        = 1
      , bsSpeed      = 100
      , bsAtkRange   = 2
      , bsSpellRange = 10
      , bsSightRange = 14
      , bsBaseExp    = 0
      , bsJobExp     = 0
      , bsHealth     = 90
      , bsMana       = 240
      , bsAspd       = 0
      }
    , cModStats = ModStats
      {
        msStr        = 2
      , msAgi        = 0
      , msVit        = 2
      , msInt        = 4
      , msDex        = 1
      , msLuk        = 0
      , msSpeed      = 0
      , msDef        = 11
      , msMdef       = 3
      , msAtkRange   = 0
      , msSpellRange = 0
      , msSightRange = 0
      , msMaxHealth  = 140
      , msMaxMana    = 240
      , msFlee       = 0
      , msHit        = 0
      , msAspd       = 0
      , msMinAtk     = 0
      , msMaxAtk     = 0
      , msFixedAtk   = 0
      , msMinMatk    = 0
      , msMaxMatk    = 0
      }
    , cSkills = []
    }

-------------------------------------------------------



version = "0.0.1.0"
prompt = "> "



run :: IO ()
run = do
    message System ("hRO version " ++ version ++ " started.")
    evalGameAction main_loop GameState { gsPlayer = testPlayer }



main_loop :: GameAction ()
main_loop = do
    liftIO $ putStr prompt
    s <- liftIO getLine
    continue <- parse_input s
    when continue main_loop

parse_input :: String -> GameAction Bool
parse_input s = process_command (head ws) (tail ws)
    where ws = words s

process_command :: String -> [String] -> GameAction Bool
process_command s p = do
    case s of
        (':':c) -> system_command c p
        ('@':c) -> game_command c p >> return True 
        _       -> player_command s p >> return True

system_command :: String -> [String] -> GameAction Bool
system_command c ps = do
    case c of
        "quit"  -> terminate
        "q"     -> terminate   
        _ -> do
            liftIO $ message Error "Unrecognised command." 
            return True
 
terminate :: GameAction Bool
terminate = do
    liftIO $ message System "Terminating."
    return False

