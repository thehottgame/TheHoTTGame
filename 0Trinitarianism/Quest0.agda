module 0Trinitarianism.Quest0 where
open import 0Trinitarianism.Preambles.P0

data ⊤ : Type where
  tt : ⊤

TrueToTrue : ⊤ → ⊤
TrueToTrue = {!!}

TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = {!!}

data ⊥ : Type where

explosion : ⊥ → ⊤
explosion x = {!!}

data ℕ : Type where
  zero : ℕ
  suc : ℕ → ℕ
