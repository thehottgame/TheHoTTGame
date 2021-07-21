module Trinitarianism.Quest0Solutions where
open import Trinitarianism.Quest0Preamble

private
  postulate
    u : Level

data ⊤ : Type u where
  trivial : ⊤

TrueToTrue : ⊤ → ⊤
TrueToTrue = λ x → x

TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = x

TrueToTrue'' : ⊤ → ⊤
TrueToTrue'' trivial = trivial

TrueToTrue''' : ⊤ → ⊤
TrueToTrue''' x = trivial

data ⊥ : Type u where

explosion : ⊥ → ⊤
explosion x = {!!}

data ℕ : Type u where
  zero : ℕ
  suc : ℕ → ℕ
