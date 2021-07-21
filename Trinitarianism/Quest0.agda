module Trinitarianism.Quest0 where
open import Trinitarianism.Quest0Preamble

postulate
  u : Level

data ⊤ : Type u where
  trivial : ⊤

TrueToTrue : ⊤ → ⊤
TrueToTrue = {!!}

TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = {!!}

data ⊥ : Type u where

explosion : ⊥ → ⊤
explosion x = {!!}

data ℕ : Type u where
  zero : ℕ
  suc : ℕ → ℕ
