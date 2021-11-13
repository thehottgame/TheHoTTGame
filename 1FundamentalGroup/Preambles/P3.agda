module 1FundamentalGroup.Preambles.P3 where

open import Cubical.Foundations.Prelude public
  renaming (transport to pathToFun ;
            transportRefl to pathToFunRefl ;
            subst to endPt) public
open import Cubical.Foundations.Isomorphism public
open import Cubical.Foundations.GroupoidLaws
  renaming (lCancel to sym∙ ; rCancel to ∙sym ; lUnit to Refl∙ ; rUnit to ∙Refl) public
open import Cubical.Foundations.Path public
open import Cubical.Data.Int using (ℤ ; isSetℤ) public
open import Cubical.Data.Nat public
open import Cubical.HITs.S1 using ( S¹ ; base ; loop ) public
open import 0Trinitarianism.Quest5Solutions public
open import 1FundamentalGroup.Quest1Solutions public

open ℤ public

endPtRefl : {A : Type} {x : A} (B : A → Type) → endPt B (refl {x = x}) ≡ λ b → b
endPtRefl {x = x} B = funExt (λ b → substRefl {B = B} b)
