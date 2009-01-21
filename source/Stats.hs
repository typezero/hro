module Stats
    (
        Class(..)
      , Race(..)
      , Property(..)
      , Size(..)
      , Stats(..)
    ) where

data Class = Novice 
           | Acolyte
           | Mob
           | Miniboss
           | MVP

data Race = Demihuman
          | Brute
          | Insect
          | Formless
          | Demon
          | Undead
          | Angel

data Property = Neutral
              | Water1  | Water2  | Water3  | Water4
              | Earth1  | Earth2  | Earth3  | Earth4
              | Fire1   | Fire2   | Fire3   | Fire4
              | Wind1   | Wind2   | Wind3   | Wind4
              | Poison1 | Poison2 | Poison3 | Poison4
              | Holy1   | Holy2   | Holy3   | Holy4
              | Shadow1 | Shadow2 | Shadow3 | Shadow4
              | Ghost1  | Ghost2  | Ghost3  | Ghost4
              | Undead1 | Undead2 | Undead3 | Undead4

data Size = Small
          | Medium
          | Large

data Stats = Stats
    {
        stClass :: Class
      , stBaseLevel :: Int
      , stJobLevel :: Int
      , stRace :: Race
      , stProperty :: Property
      , stSize :: Size
      , stStr :: Int
      , stAgi :: Int
      , stVit :: Int
      , stInt :: Int
      , stDex :: Int
      , stLuk :: Int
      , stSpeed :: Int
      , stDef :: Int
      , stMDef :: Int
      , stAtkRange :: Int
      , stSpellRange :: Int
      , stSightRange :: Int
      , stBaseExp :: Int
      , stJobExp :: Int
      , stHealth :: Int
      , stMana :: Int
      , stFlee :: Int
      , stHit :: Int
      , stAspd :: Int
      , stMinAtk :: Int
      , stMaxAtk :: Int
      , stFixedAtk :: Int
      , stMinMatk :: Int
      , stMaxMatk :: Int
    }


