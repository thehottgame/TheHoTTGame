module 1FundamentalGroup.Preambles.P1 where

open import Cubical.HITs.S1 using (S¹ ; base ; loop) public
open import Cubical.Data.Nat using (ℕ ; suc ; zero) public
open import Cubical.Data.Int using (ℤ ; pos ; negsuc ; -_) public
open import Cubical.Data.Empty public
open import Cubical.Foundations.Prelude
     renaming ( subst to endPt
              ; transport to pathToFun
              ) public
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_) public
open import 1FundamentalGroup.Quest0Solutions using ( Refl ; Refl≢loop ) public
