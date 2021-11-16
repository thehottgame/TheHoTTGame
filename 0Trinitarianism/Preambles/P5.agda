module 0Trinitarianism.Preambles.P5 where

open import Cubical.Foundations.Prelude renaming
  (funExt to libFunExt ;
   sym to libSym ;
   _≡⟨_⟩_ to lib_≡⟨_⟩_ ;
   _∎ to lib_∎ ;
   _∙_ to lib_∙_ ;
   fst to libFst ;
   snd to libSnd
  ) public
open import Cubical.HITs.S1 using ( S¹ ; base ; loop ) public
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_) public
open import Cubical.Foundations.Path public
open import 0Trinitarianism.Quest4Solutions public
open import 1FundamentalGroup.Quest0Solutions public
open import Cubical.Data.Bool public

pathToFun≡transport : {u : Level} {A B : Type u} (p : A ≡ B) (x : A)
  → pathToFun p x ≡ transport p x
pathToFun≡transport {u} {A} = J (λ B p → (x : A) → pathToFun p x ≡ transport p x)
  λ x →
      pathToFun refl x
    ≡⟨ pathToFunReflx x ⟩
      x
    ≡⟨ sym (transportRefl x) ⟩
      transport refl x ∎

PathPIsoPathD : {u : Level} {A B : Type u} (p : A ≡ B) (x : A) (y : B) →
  (PathP (λ i → p i) x y) ≅ (pathToFun p x ≡ y)
PathPIsoPathD {u} {A} {B} p x =
  subst (λ b → (y : B) → (PathP (λ i → p i) x y) ≅ (b ≡ y))
    (sym (pathToFun≡transport p x))
    (PathPIsoPath _ x)



