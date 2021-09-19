module 1FundamentalGroup.Quest1 where

open import Cubical.Core.Everything
open import Cubical.HITs.S1
open import Cubical.Data.Nat
open import Cubical.Data.Int
open import Cubical.Foundations.Prelude

Ω : (A : Type) (a : A) → Type
Ω A a = a ≡ a 

loop_times : ℤ → Ω S¹ base
loop pos zero times = refl
loop pos (suc n) times = loop pos n times ∙ loop
loop negsuc zero times = sym loop
loop negsuc (suc n) times = loop negsuc n times ∙ sym loop
