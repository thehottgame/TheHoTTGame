module 1FundamentalGroup.Quest0SideQuests.TrueNotFalseSolutions where

open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming ( Unit to ⊤ )
open import Cubical.Data.Bool using (Bool ; true ; false)
open import Cubical.Foundations.Prelude

true≢false : true ≡ false → ⊥
true≢false h = transport ⊤≡⊥ tt where

  propify : Bool → Type
  propify false = ⊥
  propify true = ⊤

  ⊤≡⊥ : ⊤ ≡ ⊥
  ⊤≡⊥ = cong propify h
{- transport

To follow a point in `a : A` along a path `p : A ≡ B`
we use

  transport : {A B : Type u} → A ≡ B → A → B

Why do we propify? Discuss.

-}
