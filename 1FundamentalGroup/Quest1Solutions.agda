-- ignore
module 1FundamentalGroup.Quest1Solutions where
open import 1FundamentalGroup.Preambles.P1


loopSpace : (A : Type) (a : A) → Type
loopSpace A a = a ≡ a

loop_times : ℤ → loopSpace S¹ base
loop pos zero times = refl
loop pos (suc n) times = loop pos n times ∙ loop
loop negsuc zero times = sym loop
loop negsuc (suc n) times = loop negsuc n times ∙ sym loop

sucℤ : ℤ → ℤ
sucℤ (pos n) = pos (suc n)
sucℤ (negsuc zero) = pos zero
sucℤ (negsuc (suc n)) = negsuc n

predℤ : ℤ → ℤ
predℤ (pos zero) = negsuc zero
predℤ (pos (suc n)) = pos n
predℤ (negsuc n) = negsuc (suc n)

sucℤIso : ℤ ≅ ℤ
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

windingNumberBase : base ≡ base → ℤ
windingNumberBase p = endPt helix p (pos zero)

windingNumber : (x : S¹) → base ≡ x → helix x
windingNumber x p = endPt helix p (pos zero)
