module 1FundamentalGroup.Quest0SideQuests.EmptySolutions where

open import 1FundamentalGroup.Preambles.PEmpty

toEmpty : (A : Type) → Type
toEmpty A = A → ⊥

pathEmpty : (A : Type) → Type₁
pathEmpty A = A ≡ ⊥

isoEmpty : (A : Type) → Type
isoEmpty A = A ≅ ⊥

toEmpty→isoEmpty : (A : Type) → toEmpty A → isoEmpty A
toEmpty→isoEmpty A f = iso f ⊥Rec rightInv leftInv where

  rightInv : section f ⊥Rec
  rightInv ()

  leftInv : retract f ⊥Rec
  leftInv x = ⊥Rec (f x)

isoEmpty→pathEmpty : (A : Type) → isoEmpty A → pathEmpty A
isoEmpty→pathEmpty A = isoToPath

pathEmpty→toEmpty : (A : Type) → pathEmpty A → toEmpty A
pathEmpty→toEmpty A p x = transport p x
