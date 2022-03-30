module 0Trinitarianism.Quest4Solutions where

open import 0Trinitarianism.Preambles.P4

private
  variable
    u : Level


data Id {A : Type u} : (x y : A) → Type u where

  rfl : {x : A} → Id x x

idSym : (A : Type u) (x y : A) → Id x y → Id y x
idSym A x .x rfl = rfl

Sym : {A : Type u} {x y : A} → Id x y → Id y x
Sym rfl = rfl

_*_ : {A : Type u} {x y z : A} → Id x y → Id y z → Id x z
rfl * q = q

_*0_ : {A : Type u} {x y z : A} → Id x y → Id y z → Id x z
p *0 rfl = p

_*1_ : {A : Type u} {x y z : A} → Id x y → Id y z → Id x z
rfl *1 rfl = rfl

------------Cong-------------------------

private
  variable
    A B : Type u
    w x y z : A

------------Groupoid Laws----------------

rfl* : (p : Id x y) → Id (rfl * p) p
rfl* p = rfl

*rfl : (p : Id x y) → Id (p * rfl) p
*rfl rfl = rfl

*Sym : (p : Id x y) → Id (p * Sym p) rfl
*Sym rfl = rfl

Sym* : {A : Type} {x y : A} (p : Id x y) → Id (Sym p * p) rfl
Sym* rfl = rfl

Assoc : (p : Id w x) (q : Id x y) (r : Id y z)
        → Id ((p * q) * r) (p * (q * r))
Assoc rfl q r = rfl


-------------Mapping Out----------------

outOfId : (M : (y : A) → Id x y → Type u) → M x rfl
  → {y : A} (p : Id x y) → M y p
outOfId M h rfl = h

------------Path vs Id--------------------

Path→Id : x ≡ y → Id x y
Path→Id {u} {A} {x} = J (λ y p → Id x y) rfl

Id→Path : Id x y → x ≡ y
Id→Path rfl = refl

-----------Basics about paths--------------

Cong : (f : A → B) → Id x y → Id (f x) (f y)
Cong f rfl = rfl

cong' : (f : A → B) (p : x ≡ y) → f x ≡ f y
cong' {x = x} f = J (λ y p → f x ≡ f y) refl

cong'' : (f : A → B) (p : x ≡ y) → f x ≡ f y
cong'' f p = Id→Path (Cong f (Path→Id p))

------------Path vs Id---------------------

Path→IdRefl : Path→Id (refl {x = x}) ≡ rfl
Path→IdRefl {x = x} = JRefl (λ y p → Id x y) rfl

Path≡Id : (x ≡ y) ≡ (Id x y)
Path≡Id {u} {A} {x} {y} = isoToPath (iso Path→Id Id→Path rightInv leftInv) where

  rightInv : section (Path→Id {u} {A} {x} {y}) Id→Path
  rightInv rfl = Path→IdRefl

  leftInv : retract (Path→Id {u} {A} {x} {y}) Id→Path
  leftInv = J (λ y p → Id→Path (Path→Id p) ≡ p) (cong (λ p → Id→Path p) Path→IdRefl)

-----------Basics about Path Space-----------------

sym : {x y : A} → x ≡ y → y ≡ x
sym {u} {A} {x} = J (λ y1 p → y1 ≡ x) refl

symRefl : {x : A} → sym {u} {A} {x} {x} (refl) ≡ refl
symRefl {u} {A} {x} = JRefl (λ y1 p → y1 ≡ x) refl

Trans : {x y z : A} → x ≡ y → y ≡ z → x ≡ z
Trans {x = x} {z = z} = J (λ y1 p → y1 ≡ z → x ≡ z) λ q → q

_∙_ = Trans -- input \.

_≡⟨_⟩_ : (x : A) → x ≡ y → y ≡ z → x ≡ z -- input \< and \>
_ ≡⟨ x≡y ⟩ y≡z = x≡y ∙ y≡z

_∎ : (x : A) → x ≡ x -- input \qed
_ ∎ = refl

infixr 30 _∙_
infix  3 _∎
infixr 2 _≡⟨_⟩_

TransRefl : {x y : A} → Trans {u} {A} {x} {x} {y} refl ≡ λ q → q
TransRefl {x = x} {y = y} = JRefl ((λ y1 p → y1 ≡ y → x ≡ y)) λ q → q

refl∙refl : {x : A} → refl {_} {A} {x} ∙ refl ≡ refl
refl∙refl = cong (λ f → f refl) TransRefl

∙refl : {x y : A} (p : x ≡ y) → Trans p refl ≡ p
∙refl {u} {A} {x} {y} = J (λ y p → Trans p refl ≡ p) refl∙refl

refl∙ : {A : Type u} {x y : A} (p : x ≡ y) → refl ∙ p ≡ p
refl∙ = J (λ y p → refl ∙ p ≡ p) refl∙refl


∙sym : {A : Type u} {x y : A} (p : x ≡ y) → p ∙ sym p ≡ refl
∙sym = J (λ y p → p ∙ sym p ≡ refl)
       (
         refl ∙ sym refl
       ≡⟨ cong (λ p → refl ∙ p) symRefl ⟩
         refl ∙ refl
       ≡⟨ refl∙refl ⟩
         refl ∎
       )


sym∙ : {A : Type u} {x y : A} (p : x ≡ y) → (sym p) ∙ p ≡ refl
sym∙ = J (λ y p → (sym p) ∙ p ≡ refl)
       (
         (sym refl) ∙ refl
       ≡⟨ cong (λ p → p ∙ refl) symRefl ⟩
         refl ∙ refl
       ≡⟨ refl∙refl ⟩
         refl ∎
       )

assoc : {A : Type u} {w x : A} (p : w ≡ x) {y z : A} (q : x ≡ y) (r : y ≡ z)
        → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r)
assoc {u} {A} = J
        -- casing on p
        (λ x p → {y z : A} (q : x ≡ y) (r : y ≡ z) → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r))
        -- reduce to showing when p = refl
        λ q r →  ((refl ∙ q) ∙ r)
                 ≡⟨ cong (λ p' → p' ∙ r) (refl∙ q) ⟩
                  (q ∙ r)
                 ≡⟨ sym (refl∙ (q ∙ r)) ⟩
                  (refl ∙ (q ∙ r)) ∎

------------------Transport---------------------

id : A → A
id x = x

pathToFun : A ≡ B → A → B
pathToFun {u} {A} = J (λ B p → (A → B)) id

pathToFunRefl : pathToFun (refl {x = A}) ≡ id
pathToFunRefl {u} {A} = JRefl (λ B p → (A → B)) id

pathToFunReflx : (x : A) → pathToFun (refl {x = A}) x ≡ x
pathToFunReflx x = cong (λ f → f x) pathToFunRefl

endPt : (B : A → Type u) (p : x ≡ y) → B x → B y
endPt {x = x} B = J (λ y p → B x → B y) id

endPtRefl : (B : A → Type u) → endPt B (refl {x = x}) ≡ id
endPtRefl {x = x} B = JRefl ((λ y p → B x → B y)) id

endPt' : (B : A → Type u) (p : x ≡ y) → B x → B y
endPt' B p = pathToFun (cong B p )

--------------funExt---------------------

funExt : {B : A → Type u} {f g : (a : A) → B a} →
  ((a : A) → f a ≡ g a) → f ≡ g
funExt h = λ i a → h a i

funExtPath : (B : A → Type u) (f g : (a : A) → B a) → (f ≡ g) ≡ ((a : A) → f a ≡ g a)
funExtPath {u} {A} B f g = isoToPath (iso fun funExt rightInv leftInv) where

  fun : f ≡ g → (a : A) → f a ≡ g a
  fun h = λ a i → h i a

  rightInv : section fun funExt
  rightInv h = refl

  leftInv : retract fun funExt
  leftInv h = refl

--------------Path on Products-----------

data _×_ (A B : Type u) : Type u where

  _,_ : A → B → A × B

Id× : (a0 a1 : A) (b0 b1 : B)
  → (Id {u} {A × B} ( a0 , b0 ) ( a1 , b1 )) ≡ (Id a0 a1 × Id b0 b1)
Id× {u} {A} {B} a0 a1 b0 b1 = isoToPath (iso fun inv rightInv leftInv) where

  fun : Id {A = A × B} ( a0 , b0 ) ( a1 , b1 ) → Id a0 a1 × Id b0 b1
  fun rfl = rfl , rfl

  inv : Id a0 a1 × Id b0 b1 → Id {A = A × B} ( a0 , b0 ) ( a1 , b1 )
  inv (rfl , rfl) = rfl

  rightInv : section fun inv
  rightInv (rfl , rfl) = refl

  leftInv : retract fun inv
  leftInv rfl = refl

fst : A × B → A
fst (a , b) = a

snd : A × B → B
snd (a , b) = b

Path× : {A B : Type u} (x y : A × B) → (x ≡ y) ≡ ((fst x ≡ fst y) × (snd x ≡ snd y))
Path× {u} {A} {B} (a0 , b0) (a1 , b1) =
  isoToPath (iso fun (inv a0 a1 b0 b1) rightInv leftInv) where

  fun : {x y : A × B} → x ≡ y → (fst x ≡ fst y) × (snd x ≡ snd y)
  fun {x} {y} = J (λ y p → (fst x ≡ fst y) × (snd x ≡ snd y)) (refl , refl)

  funRefl : (x : A × B) → fun (refl {x = x}) ≡ ( refl , refl )
  funRefl x = JRefl {_} {A × B} {x}
    ((λ y p → (fst x ≡ fst y) × (snd x ≡ snd y))) ( refl , refl )

  inv : (a0 a1 : A) (b0 b1 : B) → (a0 ≡ a1) × (b0 ≡ b1)
    → _≡_ {A = A × B} ( a0 , b0 ) ( a1 , b1 )
  inv a0 a1 b0 b1 (p , q) =
    J -- first induct on p
    (λ y p → _≡_ {A = A × B} ( a0 , b0 ) ( y , b1 ))
    (
      J -- then induct on q
      (λ y q → _≡_ {A = A × B} ( a0 , b0 ) ( a0 , y ))
      refl
      q
    ) p

  invRefl : (a : A) (b : B) → inv a a b b (refl , refl) ≡ refl
  invRefl a b =
      inv a a b b (refl , refl)
    ≡⟨ JRefl (λ y p → (a , b) ≡  (y , b)) (J (λ y q → (a , b) ≡ (a , y)) refl refl) ⟩
      J (λ y q → _≡_ {A = A × B} ( a , b ) ( a , y )) refl refl
    ≡⟨ JRefl ((λ y q → _≡_ {A = A × B} ( a , b ) ( a , y ))) refl ⟩
      refl ∎

  Inv : (x y : A × B) → (fst x ≡ fst y) × (snd x ≡ snd y) → x ≡ y
  Inv (a0 , b0) (a1 , b1) = inv a0 a1 b0 b1

  InvRefl : {x : A × B} → Inv x x (refl , refl) ≡ refl {x = x}
  InvRefl {a , b} = invRefl a b

  rightInv : section fun (inv a0 a1 b0 b1)
  rightInv (p , q) =
    J -- first induct on p
    (λ y p → fun (inv a0 y b0 b1 (p , q)) ≡ (p , q))
    (
      J -- then induct on q
      (λ y q → fun (inv a0 a0 b0 y (refl , q)) ≡ (refl , q))
      (
          fun (inv a0 a0 b0 b0 (refl , refl))
        ≡⟨ cong fun (invRefl a0 b0) ⟩
          fun (refl {x = (a0 , b0)})
        ≡⟨ funRefl (a0 , b0) ⟩
          (refl , refl) ∎)
      q)
    p

  leftInv : {x y : A × B} → retract fun (Inv x y)
  leftInv {x} = J (λ y p → Inv x y (fun p) ≡ p)
    (
      Inv x x (fun {x = x} refl)
    ≡⟨ cong (Inv x x) (funRefl x) ⟩
    Inv x x (refl , refl)
    ≡⟨ InvRefl ⟩
      refl ∎)

  leftinv : (x y : A × B) → retract fun (inv (fst x) (fst y) (snd x) (snd y))
  leftinv (a0 , b0) (a1 , b1) = leftInv
