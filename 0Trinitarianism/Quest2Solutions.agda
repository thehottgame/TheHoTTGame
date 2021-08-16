module 0Trinitarianism.Quest2Solutions where

open import 0Trinitarianism.Preambles.P2

isEven : ℕ → Type
isEven zero = ⊤
isEven (suc zero) = ⊥
isEven (suc (suc n)) = isEven n

existsEven : Σ ℕ isEven
existsEven = 4 , tt

_×_ : Type → Type → Type
A × C = Σ A (λ a → C)

div2 : Σ ℕ isEven → ℕ
div2 (0 , tt) = 0
div2 (suc (suc n) , hn) = suc (div2 (n , hn))

private
  postulate
    A B C : Type

uncurry : (A → B → C) → (A × B → C)
uncurry f (fst₁ , snd₁) = f fst₁ snd₁

curry : (A × B → C) → (A → B → C)
curry f a b = f (a , b)
