module 1FundamentalGroup.Preambles.P3 where

open import Cubical.Foundations.Prelude public
  renaming (transport to pathToFun ;
            transportRefl to pathToFunRefl ;
            subst to endPt) public
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_) public
open import Cubical.Foundations.GroupoidLaws
  renaming (lCancel to sym∙ ; rCancel to ∙sym ; lUnit to Refl∙ ; rUnit to ∙Refl) public
open import Cubical.Foundations.Path public
open import Cubical.Data.Int using (ℤ ; isSetℤ) public
open import Cubical.Data.Nat public
open import Cubical.HITs.S1 using ( S¹ ; base ; loop ) public
open import 1FundamentalGroup.Quest1Solutions public

open ℤ public

PathD : {A0 A1 : Type} (A : A0 ≡ A1) (x : A0) (y : A1) → Type
PathD A x y = pathToFun A x ≡ y

endPtRefl : {A : Type} {x : A} (B : A → Type) → endPt B (refl {x = x}) ≡ λ b → b
endPtRefl {x = x} B = funExt (λ b → substRefl {B = B} b)

outOfS¹P : (B : S¹ → Type) (b : B base) → PathP (λ i → B (loop i)) b b → (x : S¹) → B x
outOfS¹P B b p base = b
outOfS¹P B b p (loop i) = p i

outOfS¹D : (B : S¹ → Type) (b : B base) → PathD (λ i → B (loop i)) b b → (x : S¹) → B x
outOfS¹D B b p x = outOfS¹P B b (_≅_.inv (PathPIsoPath (λ i → B (loop i)) b b) p) x

outOfS¹DBase : (B : S¹ → Type) (b : B base)
  (p : PathD (λ i → B (loop i)) b b) → outOfS¹D B b p base ≡ b
outOfS¹DBase B b p = refl
