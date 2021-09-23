module 1FundamentalGroup.Quest0Solutions where

open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming ( Unit to ⊤ )
open import Cubical.Data.Bool
open import Cubical.Foundations.Prelude renaming ( subst to endPt )
open import Cubical.Foundations.Isomorphism renaming ( Iso to _≅_ )
open import Cubical.Foundations.Path
open import Cubical.HITs.S1

Refl : base ≡ base
Refl = λ i → base

Flip : Bool → Bool
Flip false = true
Flip true = false

-- notice we used `refl` instead of `λ i → false`,
-- more on `refl` in Quest1
flipIso : Bool ≅ Bool
flipIso = iso Flip Flip rightInv leftInv where
  rightInv : section Flip Flip
  rightInv false = refl
  rightInv true = refl

  leftInv : retract Flip Flip
  leftInv false = refl
  leftInv true = refl

flipPath : Bool ≡ Bool
flipPath = isoToPath flipIso

doubleCover : S¹ → Type
doubleCover base = Bool
doubleCover (loop i) = flipPath i

endPtOfTrue : (p : base ≡ base) → doubleCover base
endPtOfTrue p = endPt doubleCover p true

Refl≢loop : Refl ≡ loop → ⊥
Refl≢loop p = true≢false (cong endPtOfTrue p)
