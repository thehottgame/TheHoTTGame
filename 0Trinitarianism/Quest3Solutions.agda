module 0Trinitarianism.Quest3Solutions where

open import 0Trinitarianism.Preambles.P3

_+_ : ℕ → ℕ → ℕ
n + zero = n
n + suc m = suc (n + m)

_+'_ : ℕ → ℕ → ℕ
zero +' n = n
suc m +' n = suc (m +' n)

SumOfEven : (x y : Σ ℕ isEven) → isEven (x .fst + y .fst)
SumOfEven x (zero , hy) = x .snd
SumOfEven x (suc (suc y) , hy) = SumOfEven x (y , hy)

{-

Sum'OfEven : (x y : Σ ℕ isEven) → isEven (x .fst +' y .fst)
Sum'OfEven x (zero , hy) = x .snd
Sum'OfEven x (suc (suc y) , hy) = Sum'OfEven x (y , hy)

-}

data _⊕_ (A : Type) (B : Type) : Type where
  left : A → A ⊕ B
  right : B → A ⊕ B

_↔_ : Type → Type → Type
_↔_ A B = (A → B) × (B → A)

¬Motivation : (A : Type) → ((A ↔ ⊥) ↔ (A → ⊥))
¬Motivation A =
  -- forward direction
  (
    -- suppose we have a proof `hiff : A ↔ ⊥`
    λ hiff →
    -- give the forward map only
    fst hiff
  ) ,
  -- backward direction; assume a proof hto : A → ⊥
  λ hto →
    -- we need to show A → ⊥ which we have already
    hto
    ,
    -- we need to show ⊥ → A, which is the principle of explosion
    λ ()

¬ : Type → Type
¬ A = A → ⊥

isEvenDecidable : (n : ℕ) → isEven n ⊕ ¬ (isEven n)
-- zero is even; go left
isEvenDecidable zero = left tt
-- one is not even; go right
isEvenDecidable (suc zero) = right (λ ())
-- inductive step
isEvenDecidable (suc (suc n)) = isEvenDecidable n
