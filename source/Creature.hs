module Creature
    (
        Creature(..)  
      , calcStats
      -- Easy stat accessors:
      , baseLevel, Creature.int, maxHealth, health, maxMana, mana, atk, attackDelay
      , hasSkill
    ) where

import Stats
import ID
import Render
import Data.Ratio
  
data Creature = Creature
    {
        cID        :: CreatureID  
      , cName      :: String 
      , cBaseStats :: BaseStats
      , cModStats  :: ModStats
      , cSkills    :: [SkillID]
    } deriving (Show)

instance Render Creature where
    render c = text (cName c) <> colon <+> text "HP" <+> renderStat (health c) (maxHealth c)
               <+> text "MP" <+> renderStat (mana c) (maxMana c)
        where renderStat cur max = col (cur % max) $ Render.int cur <> char '/' <> Render.int max
              col x | x < 1%3   = red
                    | x < 2%3   = yellow
                    | otherwise = green

calcStats :: Creature -> FinalStats
calcStats c = combineStats (cBaseStats c) (cModStats c)



baseLevel :: Creature -> Int
baseLevel = fsBaseLevel . calcStats

int :: Creature -> Int
int = fsInt . calcStats

maxHealth :: Creature -> Int
maxHealth = fsMaxHealth . calcStats

health :: Creature -> Int
health = fsHealth . calcStats

maxMana :: Creature -> Int
maxMana = fsMaxMana . calcStats

mana :: Creature -> Int
mana = fsMana . calcStats

atk :: Creature -> Int
atk = fsAtk . calcStats

attackDelay :: Creature -> Double
attackDelay = undefined

hasSkill :: Creature -> SkillID -> Bool
hasSkill = undefined

