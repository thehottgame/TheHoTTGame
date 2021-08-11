module Trinitarianism.Quest0Solutions where
open import Trinitarianism.Quest0Preamble

private
  postulate
    u : Level

data ⊤ : Type u where
  trivial : ⊤

data ⊥ : Type u where

TrueToTrue : ⊤ → ⊤
TrueToTrue = λ x → x

TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = x

TrueToTrue'' : ⊤ → ⊤
TrueToTrue'' trivial = trivial

TrueToTrue''' : ⊤ → ⊤
TrueToTrue''' x = trivial

isZero : ℕ → Type u
isZero zero = ⊤
isZero (suc n) = ⊥

ExistsZero : Σ ℕ isZero
ExistsZero = zero , trivial

AllZero→⊥ : ((x : ℕ) → isZero x) → ⊥
AllZero→⊥ h = h 1

data _∨_ (P Q : Type u) : Type u where
  left : P → P ∨ Q
  right : Q → P ∨ Q

DecidableIsZero : (n : ℕ) → (isZero n) ∨ (isZero n → ⊥)
DecidableIsZero zero = left trivial
DecidableIsZero (suc n) = right (λ x → x)


