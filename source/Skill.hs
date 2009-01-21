module Skill
    (
        SkillType(..)
      , SkillTime(..)
      , SkillCost(..)
      , SkillAction
      , Skill(..)
    ) where

import Creature    
import ID

data SkillType = Targetted
               | Ground
               | Active
               | Passive

data SkillTime = Instant
               | Fixed
               | StatBased

data SkillCost = Free
               | Mana
               | Health
               | Money
               
--                 'This'   Caster      Targets    Modified targets
type SkillAction = Skill -> Creature -> [Creature] -> [Creature]
               
data Skill = Skill
    {
        skType :: SkillType 
      , skCost :: SkillCost
      , skCastTime :: SkillTime
      , skCooldownTime :: SkillTime
      , skAction :: SkillAction
    }    
    
