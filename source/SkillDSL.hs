module SkillDSL
    (
        caster
      , target
      , getCreature
      , levels
      , manaCost
      , heal
      , cooldown
      , dealPhysicalDamage
      , proc
      , Buff(..), Debuff(..)
      , buff, debuff
    ) where

import Skill
import Stats
import Creature
import Game
import Render



data SkillCreature = SkillCreature {
      getC :: SkillState -> Creature
    , setC :: SkillState -> Creature -> SkillState
    }

caster = SkillCreature stCaster (\s v -> s { stCaster = v })
target = SkillCreature stTarget (\s v -> s { stTarget = v })

modifyMana :: SkillCreature -> Int -> SkillAction ()
modifyMana c amount = do
    state <- get
    let target = getC c state
        stats = cBaseStats target
        mana = bsMana stats
        stats' = stats { bsMana = mana + amount }
        target' = target { cBaseStats = stats' }
    put $ setC c state target'
    tell [dullblue $ text "Mana changed by" <+> Render.int amount <> linebreak]
    return ()

modifyHealth :: SkillCreature -> Int -> SkillAction ()
modifyHealth c amount = do
    state <- get
    let target = getC c state
        stats = cBaseStats target
        health = bsHealth stats
        stats' = stats { bsHealth = health + amount }
        target' = target { cBaseStats = stats' }
    put $ setC c state target'
    tell [dullblue $ text "Health changed by" <+> Render.int amount <> linebreak]
    return ()

manaCost :: Int -> SkillAction ()
manaCost cost = do
    creature <- getCreature caster
    when (mana creature < cost) $
        throwError NotEnoughMana
    modifyMana caster (-cost)

levels :: Int -> Int -> SkillAction ()
levels min max = undefined

heal :: SkillCreature -> Int -> SkillAction ()
heal target amount = do
    creature <- getCreature target
    modifyHealth target $ min amount (maxHealth creature - health creature)

cooldown :: Double -> SkillAction ()
cooldown _ = return ()

getCreature :: SkillCreature -> SkillAction Creature
getCreature c = getC c `liftM` get

dealPhysicalDamage :: SkillCreature -> Int -> SkillAction ()
dealPhysicalDamage = undefined

proc :: Double -> SkillAction Bool
proc = undefined

newtype Buff = Buff Int
newtype Debuff = Debuff Int

buff :: SkillCreature -> Buff -> SkillAction ()
buff = undefined

debuff :: SkillCreature -> Debuff -> SkillAction ()
debuff = undefined

