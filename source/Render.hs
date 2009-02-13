module Render
    (
      Render(..)
    , module Text.PrettyPrint.ANSI.Leijen
    ) where

import Text.PrettyPrint.ANSI.Leijen

class Render a where
    render :: a -> Doc

