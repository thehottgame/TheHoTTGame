-- ignore
module 1FundamentalGroup.Quest1 where
open import 1FundamentalGroup.Preambles.P1


Ω : (A : Type) (a : A) → Type
Ω A a = a ≡ a

loop_times : ℤ → Ω S¹ base
loop n times = {!!}

¬isSetS¹ : isSet S¹ → ⊥
¬isSetS¹ = {!!}

¬isPropS¹ : isProp S¹ → ⊥
¬isPropS¹ = {!!}
