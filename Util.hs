module Util (
    (+++),
) where

-- | `concat` function for Maybe list.
--   concatenate Nothing as `[]`.
(+++) :: Maybe [a] -> Maybe [a] -> Maybe [a]
Nothing +++ Nothing     = Nothing
(Just ma) +++ Nothing   = Just ma
Nothing +++ (Just mb)   = Just mb
(Just ma) +++ (Just mb) = Just (ma ++ mb)
