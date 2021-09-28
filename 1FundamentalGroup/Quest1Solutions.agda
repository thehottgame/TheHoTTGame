-- ignore
module 1FundamentalGroup.Quest1Solutions where
open import 1FundamentalGroup.Preambles.P1


Ω : (A : Type) (a : A) → Type
Ω A a = a ≡ a

loop_times : ℤ → Ω S¹ base
loop pos zero times = refl
loop pos (suc n) times = loop pos n times ∙ loop
loop negsuc zero times = sym loop
loop negsuc (suc n) times = loop negsuc n times ∙ sym loop

¬isSetS¹ : isSet S¹ → ⊥
¬isSetS¹ h = Refl≢loop (h base base Refl loop)

¬isPropS¹ : isProp S¹ → ⊥
¬isPropS¹ h = ¬isSetS¹ (isProp→isSet h)
