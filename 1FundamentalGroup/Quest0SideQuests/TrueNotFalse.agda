module 1FundamentalGroup.Quest0SideQuests.TrueNotFalse where

open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming ( Unit to ⊤ )
open import Cubical.Data.Bool using (Bool ; true ; false)
open import Cubical.Foundations.Prelude

true≢false : true ≡ false → ⊥
true≢false = {!!}
