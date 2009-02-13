module SkillInfo
    (
    ) where

import Creature    
import ID

data SkillType = Targetted
               | Ground
               | Active
               | Passive

type TimeVal = Double

data SkillTime = Instant
               | Fixed TimeVal
               | StatBased TimeVal

type CostVal = Int

data SkillCost = Free
               | Mana CostVal
               | Health CostVal
               | Money CostVal
               
data SkillInfo = SkillInfo
    {
        skType :: SkillType 
      , skCost :: SkillCost
      , skCastTime :: SkillTime
      , skCooldown :: SkillTime
      , skAction :: SkillAction
    }    
