module 1FundamentalGroup.Quest1SideQuests.Sn where

open import Cubical.Data.Nat
open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming (Unit to ⊤)
open import Cubical.Data.Bool
open import Cubical.Foundations.Prelude


data susp (X : Type) : Type where
  north : {!!}
  south : {!!}
  merid : {!!}

Sphere : ℕ → Type
Sphere = {!!}

Disk : (n : ℕ) → Type
Disk zero = {!!}
Disk (suc n) = {!!}

SphereToDisk : {n : ℕ} → Sphere n → Disk n
SphereToDisk {n} s = {!!}
