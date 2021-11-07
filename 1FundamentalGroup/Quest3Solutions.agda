module 1FundamentalGroup.Quest3Solutions where

open import Cubical.HITs.S1 using ( S¹ ; base ; loop )
open import 1FundamentalGroup.Quest1Solutions
open import Cubical.Foundations.Prelude renaming (transport to pathToFun)
open import Cubical.Foundations.Path
open import 0Trinitarianism.Quest5Solutions

rewind : (x : S¹) → helix x → base ≡ x
rewind = outOfS¹D (λ x → helix x → base ≡ x) loop_times
  (
    pathToFun (λ i → sucℤPath i → base ≡ loop i) loop_times
  ≡⟨ {!!} ⟩
    loop_times ∎
  )
