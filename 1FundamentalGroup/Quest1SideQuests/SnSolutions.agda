module 1FundamentalGroup.Quest1SideQuests.SnSolutions where

open import Cubical.Data.Nat
open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming (Unit to ⊤)
open import Cubical.Data.Bool
open import Cubical.Foundations.Prelude


data susp (X : Type) : Type where
  north : susp X
  south : susp X
  merid : X → north ≡ south

Sphere : ℕ → Type
Sphere zero = Bool
Sphere (suc n) = susp (Sphere n)

Disk : (n : ℕ) → Type
Disk zero = ⊤
Disk (suc n) = susp (Sphere n)

SphereToDisk : {n : ℕ} → Sphere n → Disk (suc n)
SphereToDisk {zero} false = north
SphereToDisk {zero} true = south
SphereToDisk {suc n} north = north
SphereToDisk {suc n} south = south
SphereToDisk {suc n} (merid x i) = merid (SphereToDisk x) i
