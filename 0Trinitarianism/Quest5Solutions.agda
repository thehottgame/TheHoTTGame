module 0Trinitarianism.Quest5Solutions where

open import 0Trinitarianism.Preambles.P5

PathD : {A0 A1 : Type} (A : A0 ≡ A1) (x : A0) (y : A1) → Type
PathD A x y = pathToFun A x ≡ y

syntax PathD A x y = x ≡ y along A

outOfS¹P : (B : S¹ → Type) (b : B base) → PathP (λ i → B (loop i)) b b → (x : S¹) → B x
outOfS¹P B b p base = b
outOfS¹P B b p (loop i) = p i

outOfS¹D : (B : S¹ → Type) (b : B base) → PathD (λ i → B (loop i)) b b → (x : S¹) → B x
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

pathToFun→ : {A0 A1 B0 B1 : Type} {A : A0 ≡ A1} {B : B0 ≡ B1} (f : A0 → B0) →
  pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1))
pathToFun→ {A0} {A1} {B0} {B1} {A} {B} f =
  J (λ A1 A → pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1)))
  (
    J (λ B1 B → pathToFun (λ i → A0 → B i) f ≡ λ a → pathToFun B (f (pathToFun (sym refl) a)))
    (
        pathToFun refl f
      ≡⟨ pathToFunReflx f ⟩
        f
      ≡⟨ funExt (λ a →
           f a
         ≡⟨ cong f (sym (pathToFunReflx a)) ⟩
           f (pathToFun refl a)
         ≡⟨ cong (λ p → f (pathToFun p a)) (sym symRefl) ⟩
           f (pathToFun (sym refl) a)
         ≡⟨ sym (pathToFunReflx (f (pathToFun (sym refl) a))) ⟩
           pathToFun refl (f (pathToFun (sym refl) a)) ∎
      )
      ⟩
        (λ a → pathToFun refl (f (pathToFun (sym refl) a))) ∎
    )
    B
  )
  A
