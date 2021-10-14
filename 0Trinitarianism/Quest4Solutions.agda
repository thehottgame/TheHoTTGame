module 0Trinitarianism.Quest4Solutions where

open import Cubical.Foundations.Prelude

data _≣_ {A : Type} : (x y : A) → Type where

  rfl : (x : A) → x ≣ x
