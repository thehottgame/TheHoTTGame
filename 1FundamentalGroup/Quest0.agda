-- ignore
module 1FundamentalGroup.Quest0 where
open import 1FundamentalGroup.Preambles.P0

Refl : base ≡ base
Refl = {!!}

Flip : Bool → Bool
Flip x = {!!}

flipIso : Bool ≅ Bool
flipIso = {!!}

flipPath : Bool ≡ Bool
flipPath = {!!}

doubleCover : S¹ → Type
doubleCover x = {!!}

endPtOfTrue : base ≡ base → doubleCover base
endPtOfTrue p = {!!}

Refl≢loop : Refl ≡ loop → ⊥
Refl≢loop p = {!!}

------------------- Side Quest - Empty -------------------------

{-
-- This is a comment box,
-- remove the {- and -} to do the side quests

toEmpty : (A : Type) → Type
toEmpty A = {!!}

pathEmpty : (A : Type) → Type₁
pathEmpty A = {!!}

isoEmpty : (A : Type) → Type
isoEmpty A = {!!}

outOf⊥ : (A : Type) → ⊥ → A
outOf⊥ A ()

toEmpty→isoEmpty : (A : Type) → toEmpty A → isoEmpty A
toEmpty→isoEmpty A = {!!}

isoEmpty→pathEmpty : (A : Type) → isoEmpty A → pathEmpty A
isoEmpty→pathEmpty A = {!!}

pathEmpty→toEmpty : (A : Type) → pathEmpty A → toEmpty A
pathEmpty→toEmpty A = {!!}
-}

------------------- Side Quests - true≢false --------------------

{-
-- This is a comment box,
-- remove the {- and -} to do the side quests

true≢false' : true ≡ false → ⊥
true≢false' = {!!}

-}

