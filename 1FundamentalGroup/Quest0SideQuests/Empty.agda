module 1FundamentalGroup.Quest0SideQuests.Empty where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Empty renaming (rec to ⊥Rec)
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_)

toEmpty : (A : Type) → Type
toEmpty A = {!!}

-- why Type₁
pathEmpty : (A : Type) → Type₁
pathEmpty A = {!!}

isoEmpty : (A : Type) → Type
isoEmpty A = {!!}

toEmpty→isoEmpty : (A : Type) → toEmpty A → isoEmpty A
toEmpty→isoEmpty A f = {!!}

isoEmpty→pathEmpty : (A : Type) → isoEmpty A → pathEmpty A
isoEmpty→pathEmpty A = {!!}

pathEmpty→toEmpty : (A : Type) → pathEmpty A → toEmpty A
pathEmpty→toEmpty A p = {!!}
