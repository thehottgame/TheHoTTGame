module Trinitarianism.Quest1Solutions where

open import Cubical.Core.Everything
open import Cubical.Data.Unit renaming (Unit to ⊤)
open import Cubical.Data.Empty
open import Cubical.Data.Nat hiding (isEven)

isEven : ℕ → Type
isEven zero = ⊤
isEven (suc zero) = ⊥
isEven (suc (suc n)) = isEven n


existsEven : Σ ℕ isEven
existsEven = 4 , tt

div2 : Σ ℕ isEven → ℕ
div2 (0 , tt) = 0
div2 (suc (suc n) , hn) = suc (div2 (n , hn))
