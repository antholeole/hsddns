module Message where

import Data.Text as T

stuff :: T.Text -> T.Text
stuff = \case
  "" -> "its empty, my man"
  x | T.length x == 1 -> "only letter: " <> x
  x -> T.snoc "first letter: " <> one $ T.head x
