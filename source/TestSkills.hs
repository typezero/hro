module TestSkills
    (
      healAction
    , bashAction
    ) where

import Skill
import SkillDSL
import Creature
import ID
import Control.Monad (when)

sidAttack = SkillID 0

sidHeal = SkillID 1

healAction :: SkillLevel -> SkillAction ()
healAction level = do
    levels 1 10
    manaCost $ 10 + level * 3
    casterC <- getCreature caster
    heal target $ (baseLevel casterC + int casterC) `div` 8 * (4 + 8 * level)
    cooldown 0.5
    --modifyMana    caster $ -(10 + level * 3)
    --modifyHealth  target $ (getBaseLevel caster + getInt caster) `div` 8 * (4 + 8 * level)
    --startCooldown 0.5
    return ()

sidBash = SkillID 2

dbStun = Debuff 0

bashAction :: SkillLevel -> SkillAction ()
bashAction level = do
    levels 1 10
    manaCost $ if level < 6 then 8 else 15
    casterC <- getCreature caster
    let damageModifier | level < 4  = 1.0 + 0.3 * fromIntegral level
                       | level < 10 = 1.2 + 0.3 * fromIntegral level
                       | otherwise  = 1.0 + 0.3 * fromIntegral level
    dealPhysicalDamage target $ floor (fromIntegral (atk casterC) * damageModifier)
    let stunChance | level > 5 = fromIntegral (level - 5) * 0.05
                   | otherwise = 0
    stunProcced <- proc stunChance
    when (hasSkill casterC sidFatalBlow && stunProcced) $ debuff target dbStun
    cooldown $ attackDelay casterC

sidFatalBlow = SkillID 3

