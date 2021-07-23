module Trinitarianism.Quest1 where

open import Cubical.Core.Everything
open import Trinitarianism.Quest0Solutions

isEven : ℕ → Type u
isEven zero = ⊤
isEven (suc zero) = ⊥
isEven (suc (suc n)) = isEven n
