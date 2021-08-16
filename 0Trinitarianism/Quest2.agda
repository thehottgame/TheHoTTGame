module 0Trinitarianism.Quest2 where

open import 0Trinitarianism.Preambles.P2

isEven : ℕ → Type
isEven n = {!!}

{-
This is a comment block.
Remove this comment block and formulate
'there exists an even natural' here.
-}

_×_ : Type → Type → Type
A × C = Σ A (λ a → C)

div2 : Σ ℕ isEven → ℕ
div2 x = {!!}

private
  postulate
    A B C : Type

uncurry : (A → B → C) → (A × B → C)
uncurry f x = {!!}

curry : (A × B → C) → (A → B → C)
curry f a b = {!!}
