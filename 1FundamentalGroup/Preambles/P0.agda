module 1FundamentalGroup.Preambles.P0 where

open import Cubical.Data.Empty using (⊥) public
open import Cubical.Data.Unit renaming ( Unit to ⊤ ) public
open import Cubical.Data.Bool public
open import Cubical.Foundations.Prelude
     renaming ( subst to endPt
              ; transport to pathToFun
              ) public
open import Cubical.Foundations.Isomorphism renaming ( Iso to _≅_ ) public
open import Cubical.Foundations.Path public
open import Cubical.HITs.S1 public
