{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Skill
    (
      SkillLevel
    , SkillAction
    , SkillState(..)
    , SkillError(..)
    , runAction
    , evalAction
    , tell, get, put, throwError
    ) where

import Creature    
import Control.Monad
import Control.Monad.State
import Control.Monad.Writer
import Control.Monad.Error
import Render

type SkillLevel = Int

data SkillState = SkillState {
      stCaster :: Creature
    , stTarget :: Creature
    } deriving (Show)

data SkillError = NotEnoughMana
                | OtherError String

instance Error SkillError where
    noMsg = OtherError "Skill error occured."
    strMsg = OtherError

instance Render SkillError where
    render NotEnoughMana = red $ text "Not enough mana"
    render (OtherError s) = red $ text s

newtype SkillAction a = A {
      runA :: ErrorT SkillError (StateT SkillState (Writer [Doc])) a
    } deriving (Monad, MonadError SkillError, MonadState SkillState, MonadWriter [Doc])

runAction :: SkillAction a -> SkillState -> (Either SkillError a, SkillState, [Doc])
runAction a s = let ((r, s'), d) = runWriter $ runStateT (runErrorT $ runA a) s
                in  (r, s', d)

evalAction :: SkillAction a -> SkillState -> Either SkillError a
evalAction a s = fst . runWriter $ evalStateT (runErrorT $ runA a) s

