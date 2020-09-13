module Types where

newtype Number = Number { nVal :: Int }

-- newtype Str    = Str    { sVal :: String}

data Type = Str String
          | Sym Symbol
          | Nil
          | Ls  List


newtype List = List { list :: [Type] }

-- TODO: List's representation
-- instance Show List where

data Symbol = LTrue
            | LSym    String

instance Show Symbol where
    show LTrue = "#t"
    show (LSym s) = s

data Token = LParen
           | RParen
           | LNumber
           | LSymbol
           | LList
           | LNil
           | LString
           | LBool

class Comparable c
instance Comparable Number
instance Comparable Symbol

{-
toType :: (Token, a) -> Type
toType a = case a of
               (LNumber, x) -> Number x
               (LSymbol, s) -> Symbol s
               (LList, ts)  -> List ts
               (LString, s) -> Str s
               (LNil, ())   -> Nil
               _            -> undefined
-}
