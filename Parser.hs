module Parser (
    digit, digits, readAInt, readInt,
) where


import Control.Applicative ((<|>))
import Util ((+++))

-- | Take a Int value `i` and a string, and return `Just i` if the string is the same as `show i`, otherwise `Nothing`.
digit :: Int -> String -> Maybe Int
digit _ [] = Nothing
digit i (c:_) | i > 9 || i < 0 = Nothing
              | otherwise =
                if [c] == show i
                    then Just i
                    else Nothing

digits :: [String] -> [Maybe String]
digits = map (fmap show . readAInt)

readAInt :: String -> Maybe Int
readAInt s = foldl1 (<|>) $ map (flip digit $ s) [0..9]

readInt :: String -> Maybe String
readInt s = foldl1 (+++) $ (digits . strToList) s
  where strToList = map (:[])

-- TODO: add some type's parsers
