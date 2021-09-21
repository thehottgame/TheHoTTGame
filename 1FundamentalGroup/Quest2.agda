module 1FundamentalGroup.Quest2 where

open import Cubical.Core.Everything
open import Cubical.Data.Nat
open import Cubical.Data.Int using (ℤ ; pos ; negsuc ; -_)
open import Cubical.Foundations.Isomorphism
open import Cubical.Foundations.Prelude renaming (subst to endPt)
open import Cubical.HITs.S1 using (S¹ ; base ; loop)
open import 1FundamentalGroup.Quest1

sucℤ : ℤ → ℤ
sucℤ (pos n) = pos (suc n)
sucℤ (negsuc zero) = pos zero
sucℤ (negsuc (suc n)) = negsuc n

predℤ : ℤ → ℤ
predℤ (pos zero) = negsuc zero
predℤ (pos (suc n)) = pos n
predℤ (negsuc n) = negsuc (suc n)

sucℤIso : Iso ℤ ℤ
sucℤIso = iso sucℤ predℤ s r where

  s : section sucℤ predℤ
  s (pos zero) = refl
  s (pos (suc n)) = refl
  s (negsuc zero) = refl
  s (negsuc (suc n)) = refl

  r : retract sucℤ predℤ
  r (pos zero) = refl
  r (pos (suc n)) = refl
  r (negsuc zero) = refl
  r (negsuc (suc n)) = refl

sucℤPath : ℤ ≡ ℤ
sucℤPath = isoToPath sucℤIso

helix : S¹ → Type
helix base = ℤ
helix (loop i) = sucℤPath i

spinCountBase : base ≡ base → ℤ
spinCountBase p = endPt helix p 0

spinCount : (x : S¹) → base ≡ x → helix x
spinCount x p = endPt helix p 0
