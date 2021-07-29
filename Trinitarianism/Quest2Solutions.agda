module Trinitarianism.Quest2Solutions where

open import Trinitarianism.Preambles.P2

_+_ : ℕ → ℕ → ℕ
n + zero = n
n + suc m = suc (n + m)

_+'_ : ℕ → ℕ → ℕ
zero +' n = n
suc m +' n = suc (m +' n)

SumOfEven : (x : Σ ℕ isEven) → (y : Σ ℕ isEven) → isEven (x .fst + y .fst)
SumOfEven x (zero , hy) = x .snd
SumOfEven x (suc (suc y) , hy) = SumOfEven x (y , hy)

{-

Sum'OfEven : (x : Σ ℕ isEven) → (y : Σ ℕ isEven) → isEven (x .fst +' y .fst)
Sum'OfEven x (zero , hy) = x .snd
Sum'OfEven x (suc (suc y) , hy) = Sum'OfEven x (y , hy)

-}
