{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Game
    (
      GameState(..)
    , GameAction
    , runGameAction
    , evalGameAction
    , player
    , useSkill
    , renderPlayerStats
    , module Control.Monad.State
    ) where

import Creature
import Stats
import ID
import Skill
import Render
import Control.Monad.State

data GameState = GameState {
      gsPlayer :: Creature
    } deriving (Show)

newtype GameAction a = A {
      runA :: StateT GameState IO a
    } deriving (Monad, MonadIO, MonadState GameState)
    
runGameAction :: GameAction a -> GameState -> IO (a, GameState)
runGameAction a s = runStateT (runA a) s

evalGameAction :: GameAction a -> GameState -> IO a
evalGameAction a s = evalStateT (runA a) s

data GameCreature = GameCreature {
      getC :: GameState -> Creature
    , setC :: GameState -> Creature -> GameState
    }

player = GameCreature gsPlayer (\s v -> s { gsPlayer = v })

useSkill :: SkillAction a -> GameCreature -> GameCreature -> GameAction (Maybe a)
useSkill action caster target = do
    state <- get
    let (result, skillState', output) = runAction action $ SkillState (getC caster state) (getC target state)
    liftIO $ mapM_ putDoc output
    put $ setC caster (setC target state $ stTarget skillState') $ stCaster skillState'
    case result of
        Left error -> do
            liftIO . putDoc $ render error <> linebreak
            return Nothing
        Right a -> return (Just a)

renderPlayerStats :: GameAction ()
renderPlayerStats = do
    player <- gsPlayer `liftM` get
    liftIO . putDoc $ render player <> linebreak
