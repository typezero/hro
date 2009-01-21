module Creature
    (
        Creature(..)  
    ) where

import Stats
import ID
  
data Creature = Creature
    {
        cID        :: CreatureID  
      , cBaseStats :: Stats
      , cModStats  :: Stats
      , cSkills    :: [SkillID]
    }  

