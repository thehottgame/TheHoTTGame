module Trinitarianism.Quest0 where
open import Trinitarianism.Quest0Preamble

data ⊤ : Type where
  trivial : ⊤

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
