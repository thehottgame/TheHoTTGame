module 1FundamentalGroup.Quest2 where

open import 1FundamentalGroup.Preambles.P2

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
spinCountBase p = endPt helix p (pos zero)

spinCount : (x : S¹) → base ≡ x → helix x
spinCount x p = endPt helix p (pos zero)
