module Application
  (
    run
  ) where

import Utility
import Game
import Player

import Control.Monad (when)



version = "0.0.0.1"
prompt = "> "



run :: IO ()
run = do
    message System ("hRO version " ++ version ++ " started.")
    main_loop



main_loop :: IO ()
main_loop = do
    putStr prompt
    s <- getLine
    continue <- parse_input s
    when continue main_loop

parse_input :: String -> IO Bool
parse_input s = process_command (head ws) (tail ws)
    where ws = words s

process_command :: String -> [String] -> IO Bool
process_command s p = do
    case s of
        (':':c) -> system_command c p
        ('@':c) -> game_command c p >> return True 
        _       -> player_command s p >> return True

system_command :: String -> [String] -> IO Bool
system_command c ps = do
    case c of
        "quit"  -> terminate
        "q"     -> terminate   
        _ -> do
            message Error "Unrecognised command." 
            return True
 
terminate :: IO Bool
terminate = do
    message System "Terminating."
    return False

