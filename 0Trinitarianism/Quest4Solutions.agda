module 0Trinitarianism.Quest4Solutions where

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_)

data Id {A : Type} : (x y : A) → Type where

  rfl : {x : A} → Id x x

idSym : (A : Type) (x y : A) → Id x y → Id y x
idSym A x .x rfl = rfl

Sym : {A : Type} {x y : A} → Id x y → Id y x
Sym rfl = rfl

_*_ : {A : Type} {x y z : A} → Id x y → Id y z → Id x z
rfl * q = q

_*0_ : {A : Type} {x y z : A} → Id x y → Id y z → Id x z
p *0 rfl = p

_*1_ : {A : Type} {x y z : A} → Id x y → Id y z → Id x z
rfl *1 rfl = rfl

data _×_ (A B : Type) : Type where

  _,_ : A → B → A × B

id× : {A B : Type} (a0 a1 : A) (b0 b1 : B) →
  (Id a0 a1 × Id b0 b1) ≅ Id {A × B} ( a0 , b0 ) ( a1 , b1 )
id× {A} {B} a0 a1 b0 b1 = iso fun inv rightInv leftInv where

  fun : Id a0 a1 × Id b0 b1 → Id {A × B} ( a0 , b0 ) ( a1 , b1 )
  fun (rfl , rfl) = rfl

  inv : Id {A × B} ( a0 , b0 ) ( a1 , b1 ) → Id a0 a1 × Id b0 b1
  inv rfl = rfl , rfl

  rightInv : section fun inv
  rightInv rfl = refl

  leftInv : retract fun inv
  leftInv (rfl , rfl) = refl

------------Cong-------------------------

private
  variable
    A B : Type

Cong : {x y : A} (f : A → B) → Id x y → Id (f x) (f y)
Cong f rfl = rfl

------------Groupoid Laws----------------

rfl* : {x y : A} (p : Id x y) → Id (rfl * p) p
rfl* p = rfl

*rfl : {x y : A} (p : Id x y) → Id (p * rfl) p
*rfl rfl = rfl

*Sym : {A : Type} {x y : A} (p : Id x y) → Id (p * Sym p) rfl
*Sym rfl = rfl

Sym* : {A : Type} {x y : A} (p : Id x y) → Id rfl (p * Sym p)
Sym* rfl = rfl

Assoc : {A : Type} {w x y z : A} (p : Id w x) (q : Id x y) (r : Id y z)
        → Id ((p * q) * r) (p * (q * r))
Assoc rfl q r = rfl
