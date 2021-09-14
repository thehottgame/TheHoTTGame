module 1FundamentalGroup.Quest0 where

open import Cubical.Core.Everything
open import Cubical.Data.Empty
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Path
open import Cubical.Foundations.GroupoidLaws

data S¹ : Type where
  base : S¹
  loop : base ≡ base

¬ : Type → Type
¬ A = A → ⊥

doubleCover : type
doubleCover = ?


refl≢loop : ¬ ( refl ≡ loop )
refl≢loop h = {!!}
