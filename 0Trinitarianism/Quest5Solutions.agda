module 0Trinitarianism.Quest5Solutions where

open import Cubical.Foundations.Prelude renaming (subst to endPt ; transport to pathToFun)
open import Cubical.HITs.S1 using ( S¹ ; base ; loop )
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_)
open import Cubical.Foundations.Path renaming (PathPIsoPath to PathPIsoPathD)
open import 1FundamentalGroup.Quest0Solutions
open import Cubical.Data.Bool

PathD : {A0 A1 : Type} (A : A0 ≡ A1) (x : A0) (y : A1) → Type
PathD A x y = pathToFun A x ≡ y

syntax PathD A x y = x ≡ y along A

outOfS¹P : (B : S¹ → Type) (b : B base) → PathP (λ i → B (loop i)) b b → (x : S¹) → B x
outOfS¹P B b p base = b
outOfS¹P B b p (loop i) = p i

outOfS¹D : (B : S¹ → Type) (b : B base) → b ≡ b along (λ i → B (loop i)) → (x : S¹) → B x
outOfS¹D B b p x = outOfS¹P B b (_≅_.inv (PathPIsoPathD (λ i → B (loop i)) b b) p) x

example : (x : S¹) → doubleCover x → doubleCover x
example base = Flip
example (loop i) = p i where

  lem : (x : Bool) → pathToFun (λ i → flipPath i → flipPath i) Flip x ≡ Flip x
  lem false = refl
  lem true = refl

  p : PathP (λ i → flipPath i → flipPath i) Flip Flip
  p = _≅_.inv (PathPIsoPathD (λ i → flipPath i → flipPath i) Flip Flip) (funExt lem)

-- repeating the example but using our API

example' : (x : S¹) → doubleCover x → doubleCover x
example' = outOfS¹D (λ x → doubleCover x → doubleCover x) Flip (funExt lem) where

  lem : (x : Bool) → pathToFun (λ i → flipPath i → flipPath i) Flip x ≡ Flip x
  lem false = refl
  lem true = refl

outOfS¹DBase : (B : S¹ → Type) (b : B base)
  (p : b ≡ b along (λ i → B (loop i)))→ outOfS¹D B b p base ≡ b
outOfS¹DBase B b p = refl
