module ID
    (
        CreatureID(..)
      , SkillID(..)
    ) where

newtype CreatureID = CreatureID Int
    deriving (Show)

newtype SkillID = SkillID Int    
    deriving (Show)
