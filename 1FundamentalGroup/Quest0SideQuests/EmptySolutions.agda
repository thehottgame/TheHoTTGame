module 1FundamentalGroup.Quest0SideQuests.EmptySolutions where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Empty renaming (rec to ⊥Rec)
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_)

toEmpty : (A : Type) → Type
toEmpty A = A → ⊥

-- why Type₁
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
pathEmpty→toEmpty A p = J (λ B q → toEmpty B) (λ x → x) (sym p)
