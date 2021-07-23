module Trinitarianism.Quest0Solutions where
open import Trinitarianism.Quest0Preamble


data ⊤ : Type where
  trivial : ⊤

TrueToTrue : ⊤ → ⊤
TrueToTrue = λ x → x

TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = x

TrueToTrue'' : ⊤ → ⊤
TrueToTrue'' trivial = trivial

TrueToTrue''' : ⊤ → ⊤
TrueToTrue''' x = trivial

data ⊥ : Type where

explosion : ⊥ → ⊤
explosion ()

data ℕ : Type where
  zero : ℕ
  suc : ℕ → ℕ
