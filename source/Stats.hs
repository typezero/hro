module Stats
    (
        Class(..)
      , Race(..)
      , Property(..)
      , Size(..)
      , BaseStats(..)
      , ModStats(..)
      , FinalStats(..)
      , combineStats
    ) where

data Class = Novice 
           | Acolyte
           | Mob
           | Miniboss
           | MVP
           deriving (Show)

data Race = Demihuman
          | Brute
          | Insect
          | Formless
          | Demon
          | Undead
          | Angel
          deriving (Show)     

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
              deriving (Show)

data Size = Small
          | Medium
          | Large
          deriving (Show)

data BaseStats = BaseStats
     {
       bsClass      :: Class
     , bsBaseLevel  :: Int
     , bsJobLevel   :: Int
     , bsRace       :: Race
     , bsProperty   :: Property
     , bsSize       :: Size
     , bsStr        :: Int
     , bsAgi        :: Int
     , bsVit        :: Int
     , bsInt        :: Int
     , bsDex        :: Int
     , bsLuk        :: Int
     , bsSpeed      :: Int
     , bsAtkRange   :: Int
     , bsSpellRange :: Int
     , bsSightRange :: Int
     , bsBaseExp    :: Int
     , bsJobExp     :: Int
     , bsHealth     :: Int
     , bsMana       :: Int
     , bsAspd       :: Int
     } deriving (Show)

data ModStats = ModStats
     {
       msStr         :: Int
     , msAgi         :: Int
     , msVit         :: Int
     , msInt         :: Int
     , msDex         :: Int
     , msLuk         :: Int
     , msSpeed       :: Int
     , msDef         :: Int
     , msMdef        :: Int
     , msAtkRange    :: Int
     , msSpellRange  :: Int
     , msSightRange  :: Int
     , msMaxHealth   :: Int
     , msMaxMana     :: Int
     , msFlee        :: Int
     , msHit         :: Int
     , msAspd        :: Int
     , msMinAtk      :: Int
     , msMaxAtk      :: Int
     , msFixedAtk    :: Int
     , msMinMatk     :: Int
     , msMaxMatk     :: Int
     } deriving (Show)

data FinalStats = FinalStats
     {
       fsClass      :: Class
     , fsBaseLevel  :: Int
     , fsJobLevel   :: Int
     , fsRace       :: Race
     , fsProperty   :: Property
     , fsSize       :: Size
     , fsStr        :: Int
     , fsAgi        :: Int
     , fsVit        :: Int
     , fsInt        :: Int
     , fsDex        :: Int
     , fsLuk        :: Int
     , fsSpeed      :: Int
     , fsDef        :: Int
     , fsMdef       :: Int
     , fsAtkRange   :: Int
     , fsSpellRange :: Int
     , fsSightRange :: Int
     , fsBaseExp    :: Int
     , fsJobExp     :: Int
     , fsHealth     :: Int
     , fsMaxHealth  :: Int
     , fsMana       :: Int
     , fsMaxMana    :: Int
     , fsFlee       :: Int
     , fsHit        :: Int
     , fsAspd       :: Int
     , fsMinAtk     :: Int
     , fsMaxAtk     :: Int
     , fsFixedAtk   :: Int
     , fsAtk        :: Int
     , fsMinMatk    :: Int
     , fsMaxMatk    :: Int
     , fsMatk       :: Int
     } deriving (Show)

combineStats :: BaseStats -> ModStats -> FinalStats
combineStats b m = FinalStats
     {
       fsClass      = bsClass b
     , fsBaseLevel  = bsBaseLevel b
     , fsJobLevel   = bsJobLevel b
     , fsRace       = bsRace b
     , fsProperty   = bsProperty b
     , fsSize       = bsSize b
     , fsStr        = bsStr b + msStr m
     , fsAgi        = bsAgi b + msAgi m
     , fsVit        = bsVit b + msVit m
     , fsInt        = bsInt b + msVit m
     , fsDex        = bsDex b + msDex m
     , fsLuk        = bsLuk b + msLuk m
     , fsSpeed      = bsSpeed b + msSpeed m
     , fsDef        = msDef m
     , fsMdef       = msMdef m
     , fsAtkRange   = bsAtkRange b + msAtkRange m
     , fsSpellRange = bsSpellRange b + msSpellRange m
     , fsSightRange = bsSightRange b + msSightRange m
     , fsBaseExp    = bsBaseExp b
     , fsJobExp     = bsJobExp b
     , fsHealth     = bsHealth b
     , fsMaxHealth  = msMaxHealth m
     , fsMana       = bsMana b
     , fsMaxMana    = msMaxMana m
     , fsFlee       = bsBaseLevel b + bsAgi b + msAgi m + msFlee m
     , fsHit        = bsBaseLevel b + bsDex b + msDex m + msHit m
     , fsAspd       = bsAspd b + msAspd m
     , fsMinAtk     = 1
     , fsMaxAtk     = 1
     , fsFixedAtk   = 0
     , fsAtk        = 1
     , fsMinMatk    = 1
     , fsMaxMatk    = 1
     , fsMatk       = 1
     }
