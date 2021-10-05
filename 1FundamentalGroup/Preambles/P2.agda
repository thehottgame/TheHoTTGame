module 1FundamentalGroup.Preambles.P2 where

open import Cubical.Data.Nat public
open import Cubical.Data.Int using (ℤ ; pos ; negsuc ; -_) public
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_) public
open import Cubical.Data.Empty using (⊥) public
open import Cubical.Data.Unit renaming (Unit to ⊤) public
open import Cubical.Foundations.Prelude
     renaming ( subst to endPt
              ; transport to pathToFun
              ) public
open import Cubical.HITs.S1 using (S¹ ; base ; loop) public
open import 1FundamentalGroup.Quest1Solutions public

refl∙refl : {A : Type} {a : A} → refl ∙ refl ≡ refl {x = a}
refl∙refl {a = a} = sym (λ i j → compPath-filler (refl {x = a}) refl i j)

symRefl : {A : Type} {a : A} → sym refl ≡ refl {x = a}
symRefl = refl
