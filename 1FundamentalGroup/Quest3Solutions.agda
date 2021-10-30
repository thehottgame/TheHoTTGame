module 1FundamentalGroup.Quest3Solutions where

open import Cubical.Foundations.Prelude
open import Cubical.HITs.S1
open import 1FundamentalGroup.Quest1Solutions

outOfS¹ : (B : S¹ → Type) → (b : B base) → PathP (λ i → B (loop i)) b b → (x : S¹) → B x
outOfS¹ B b p base = b
outOfS¹ B b p (loop i) = p i
