module 1FundamentalGroup.Quest3Solutions where

open import Cubical.Foundations.Prelude
open import Cubical.HITs.S1 using ( S¹ ; base ; loop )
open import 1FundamentalGroup.Quest1Solutions
open import Cubical.Foundations.Path

outOfS¹ : (B : S¹ → Type) → (b : B base) → PathP (λ i → B (loop i)) b b → (x : S¹) → B x
outOfS¹ B b p base = b
outOfS¹ B b p (loop i) = p i



rewind : (x : S¹) → helix x → base ≡ x
rewind base = loop_times
rewind (loop i) = path i where

   path : PathP (λ i → helix (loop i) → base ≡ loop i) loop_times loop_times
   path  = {!!}

thing = PathPIsoPath
