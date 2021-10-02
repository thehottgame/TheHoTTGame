-- ignore
module 1FundamentalGroup.Quest1 where
open import 1FundamentalGroup.Preambles.P1


loopSpace : (A : Type) (a : A) → Type
loopSpace A a = a ≡ a

loop_times : ℤ → loopSpace S¹ base
loop n times = {!!}

{-
The definition of sucℤ goes here.
-}

{-
The definition of predℤ goes here.
-}

{-
The definition of sucℤIso goes here.
-}

{-
The definition of sucℤPath goes here.
-}

helix : S¹ → Type
helix = {!!}

windingNumberBase : base ≡ base → ℤ
windingNumberBase = {!!}

windingNumber : (x : S¹) → base ≡ x → helix x
windingNumber = {!!}
