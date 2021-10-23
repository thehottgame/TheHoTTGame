module 0Trinitarianism.Quest4Solutions where

open import Cubical.Foundations.Prelude using ( Level ; Type ; _≡_ ; J ; JRefl ; refl )
open import Cubical.Foundations.Isomorphism renaming (Iso to _≅_)

infixr 30 _∙_
infix  3 _∎
infixr 2 _≡⟨_⟩_

private
  variable
    u : Level


data Id {A : Type u} : (x y : A) → Type u where

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

-- id× : {A B : Type} (a0 a1 : A) (b0 b1 : B) →
--   (Id a0 a1 × Id b0 b1) ≅ Id {A × B} ( a0 , b0 ) ( a1 , b1 )
-- id× {A} {B} a0 a1 b0 b1 = iso fun inv rightInv leftInv where

--   fun : Id a0 a1 × Id b0 b1 → Id {A × B} ( a0 , b0 ) ( a1 , b1 )
--   fun (rfl , rfl) = rfl

--   inv : Id {A × B} ( a0 , b0 ) ( a1 , b1 ) → Id a0 a1 × Id b0 b1
--   inv rfl = rfl , rfl

--   rightInv : section fun inv
--   rightInv rfl = refl

--   leftInv : retract fun inv
--   leftInv (rfl , rfl) = refl

------------Cong-------------------------

private
  variable
    A B : Type
    w x y z : A

------------Groupoid Laws----------------

rfl* : (p : Id x y) → Id (rfl * p) p
rfl* p = rfl

*rfl : (p : Id x y) → Id (p * rfl) p
*rfl rfl = rfl

*Sym : (p : Id x y) → Id (p * Sym p) rfl
*Sym rfl = rfl

Sym* : (p : Id x y) → Id rfl (p * Sym p)
Sym* rfl = rfl

Assoc : (p : Id w x) (q : Id x y) (r : Id y z)
        → Id ((p * q) * r) (p * (q * r))
Assoc rfl q r = rfl


-------------Mapping Out----------------

thing = JRefl

outOfId : (M : (y : A) → Id x y → Type) → M x rfl
  → {y : A} (p : Id x y) → M y p
outOfId M h rfl = h

------------Path vs Id--------------------

Path→Id : x ≡ y → Id x y
Path→Id {A} {x} = J (λ y p → Id x y) rfl

Id→Path : Id x y → x ≡ y
Id→Path rfl = refl

-----------Basics about paths--------------

Cong : (f : A → B) → Id x y → Id (f x) (f y)
Cong f rfl = rfl

cong : (f : A → B) (p : x ≡ y) → f x ≡ f y
cong {x = x} f = J (λ y p → f x ≡ f y) refl

cong' : (f : A → B) (p : x ≡ y) → f x ≡ f y
cong' f p = Id→Path (Cong f (Path→Id p))

------------Path vs Id---------------------

Path→IdRefl : Path→Id (refl {x = x}) ≡ rfl
Path→IdRefl {x = x} = JRefl (λ y p → Id x y) rfl

Path≡Id : (x ≡ y) ≡ (Id x y)
Path≡Id {A} {x} {y} = isoToPath (iso Path→Id Id→Path rightInv leftInv) where

  rightInv : section (Path→Id {A} {x} {y}) Id→Path
  rightInv rfl = Path→IdRefl

  leftInv : retract (Path→Id {A} {x} {y}) Id→Path
  leftInv = J (λ y p → Id→Path (Path→Id p) ≡ p) (cong (λ p → Id→Path p) Path→IdRefl)


  -- leftInv : retract (Path→Id {A} {x} {y}) Id→Path
  -- leftInv = J (λ y p → Id→Path (Path→Id p) ≡ p)
  --   (
  --     Id→Path (Path→Id refl)
  --   ≡⟨ cong (λ p → Id→Path p) Path→IdRefl ⟩
  --     Id→Path rfl
  --   ≡⟨ refl ⟩
  --     refl ∎
  --   )

-----------Basics about Path Space-----------------

sym : {x y : A} → x ≡ y → y ≡ x
sym {A} {x} = J (λ y1 p → y1 ≡ x) refl

symRefl : {x : A} → sym {A} {x} {x} (refl) ≡ refl
symRefl {A} {x} = JRefl (λ y1 p → y1 ≡ x) refl

Trans : {x y z : A} → x ≡ y → y ≡ z → x ≡ z
Trans {x = x} {z = z} = J (λ y1 p → y1 ≡ z → x ≡ z) λ q → q

_∙_ = Trans -- input \.

_≡⟨_⟩_ : (x : A) → x ≡ y → y ≡ z → x ≡ z
_ ≡⟨ x≡y ⟩ y≡z = x≡y ∙ y≡z

_∎ : (x : A) → x ≡ x
_ ∎ = refl

TransRefl : {x y : A} → Trans {A} {x} {x} {y} refl ≡ λ q → q
TransRefl {x = x} {y = y} = JRefl ((λ y1 p → y1 ≡ y → x ≡ y)) λ q → q

refl∙refl : {x : A} → refl {_} {A} {x} ∙ refl ≡ refl
refl∙refl = cong (λ f → f refl) TransRefl

∙refl : {x y : A} (p : x ≡ y) → Trans p refl ≡ p
∙refl {A} {x} {y} = J (λ y p → Trans p refl ≡ p) refl∙refl

refl∙ : {A : Type} {x y : A} (p : x ≡ y) → refl ∙ p ≡ p
refl∙ = J (λ y p → refl ∙ p ≡ p) refl∙refl


∙sym : {A : Type} {x y : A} (p : x ≡ y) → p ∙ sym p ≡ refl
∙sym = J (λ y p → p ∙ sym p ≡ refl)
       (
         refl ∙ sym refl
       ≡⟨ cong (λ p → refl ∙ p) symRefl ⟩
         refl ∙ refl
       ≡⟨ refl∙refl ⟩
         refl ∎
       )


sym∙ : {A : Type} {x y : A} (p : x ≡ y) → (sym p) ∙ p ≡ refl
sym∙ = J (λ y p → (sym p) ∙ p ≡ refl)
       (
         (sym refl) ∙ refl
       ≡⟨ cong (λ p → p ∙ refl) symRefl ⟩
         refl ∙ refl
       ≡⟨ refl∙refl ⟩
         refl ∎
       )

assoc : {A : Type} {w x : A} (p : w ≡ x) {y z : A} (q : x ≡ y) (r : y ≡ z)
        → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r)
assoc {A} = J
        -- casing on p
        (λ x p → {y z : A} (q : x ≡ y) (r : y ≡ z) → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r))
        -- reduce to showing when p = refl
        λ q r →  ((refl ∙ q) ∙ r)
                 ≡⟨ cong (λ p' → p' ∙ r) (refl∙ q) ⟩
                  (q ∙ r)
                 ≡⟨ sym (refl∙ (q ∙ r)) ⟩
                  (refl ∙ (q ∙ r)) ∎
