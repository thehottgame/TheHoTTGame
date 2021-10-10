-- ignore
module 1FundamentalGroup.Quest2Solutions where
open import 1FundamentalGroup.Preambles.P2

isSet→LoopSpace≡⊤ : {A : Type} (x : A) → isSet A → (x ≡ x) ≡ ⊤
isSet→LoopSpace≡⊤ x h = isoToPath (iso (λ p → tt) inv rightInv (λ p → h x x refl p)) where

  inv : ⊤ → x ≡ x
  inv tt = refl

  rightInv : section (λ p → tt) inv
  rightInv tt = refl


data _⊔_ (A B : Type) : Type where

     inl : A → A ⊔ B
     inr : B → A ⊔ B

ℤ≡ℕ⊔ℕ : ℤ ≡ ℕ ⊔ ℕ
ℤ≡ℕ⊔ℕ = isoToPath (iso fun inv rightInv leftInv) where

  fun : ℤ → ℕ ⊔ ℕ
  fun (pos n) = inl n
  fun (negsuc n) = inr n

  inv : ℕ ⊔ ℕ → ℤ
  inv (inl n) = pos n
  inv (inr n) = negsuc n

  rightInv : section fun inv
  rightInv (inl n) = refl
  rightInv (inr n) = refl

  leftInv : retract fun inv
  leftInv (pos n) = refl
  leftInv (negsuc n) = refl

private
  variable
    A B : Type

isProp⊤ : isProp ⊤
isProp⊤ tt tt = refl

isProp⊥ : isProp ⊥
isProp⊥ ()

⊔NoConfusion : A ⊔ B → A ⊔ B → Type
⊔NoConfusion (inl x) (inl y) = x ≡ y -- Path A x y
⊔NoConfusion (inl x) (inr y) = ⊥
⊔NoConfusion (inr x) (inl y) = ⊥
⊔NoConfusion (inr x) (inr y) = x ≡ y -- Path B x y

isSet⊔NoConfusion : isSet A → isSet B
                     → (x y : A ⊔ B) → isProp (⊔NoConfusion x y)
isSet⊔NoConfusion hA hB (inl x) (inl y) = hA x y
isSet⊔NoConfusion hA hB (inl x) (inr y) = isProp⊥
isSet⊔NoConfusion hA hB (inr x) (inl y) = isProp⊥
isSet⊔NoConfusion hA hB (inr x) (inr y) = hB x y

⊔NoConfusionSelf : (x : A ⊔ B) → ⊔NoConfusion x x
⊔NoConfusionSelf (inl x) = refl
⊔NoConfusionSelf (inr x) = refl

disjoint : (x : A) (y : B) → inl x ≡ inr y → ⊥
disjoint x y p = endPt bundle p tt where

  bundle : A ⊔ B → Type
  bundle (inl x) = ⊤
  bundle (inr x) = ⊥

Path≅⊔NoConfusion : (x y : A ⊔ B) → (x ≡ y) ≅ ⊔NoConfusion x y
Path≅⊔NoConfusion x y = iso (fun _ _) (inv _ _) (rightInv _ _) (leftInv _ _) where

  -- if you case on x and y you would have to show that inl and inr are injective
  -- J avoids this, but leads to needing J and JRefl for showing section and retract
  fun : (x y : A ⊔ B) → (x ≡ y) → ⊔NoConfusion x y
  fun x y = J (λ y' p → ⊔NoConfusion x y') (⊔NoConfusionSelf _)

  inv : (x y : A ⊔ B) → ⊔NoConfusion x y → x ≡ y
  inv (inl x) (inl y) p = cong inl p
  inv (inr x) (inr y) p = cong inr p

  rightInv : (x y : A ⊔ B) → section (fun x y) (inv x y)
  rightInv {A} {B} (inl x) (inl y) p = J (λ y' p → fun {A} {B} (inl x) (inl y') (inv (inl x) (inl y') p) ≡ p)
                        (
                          fun {A} {B} (inl x) (inl x) refl
                        ≡⟨ JRefl {x = inl x} ((λ y' p → ⊔NoConfusion {A} {B} (inl x) y')) _ ⟩
                        -- uses how J computes on refl
                          refl ∎
                        ) p

  rightInv {A} {B} (inr x) (inr y) p = J (λ y' p → fun {A} {B} (inr x) (inr y') (inv (inr x) (inr y') p) ≡ p)
                     (
                       fun {A} {B} (inr x) (inr x) refl
                     ≡⟨ JRefl {x = inr x} ((λ y' p → ⊔NoConfusion {A} {B} (inr x) y')) _ ⟩
                     -- uses how J computes on refl
                       refl ∎
                     ) p

  leftInv : (x y : A ⊔ B) → retract (fun x y) (inv x y)
  leftInv x y = J (λ y' p → inv x y' (fun x y' p) ≡ p)
                  (
                    (inv x x (fun x x refl))
                  ≡⟨ cong (inv x x) (JRefl ((λ y' p → ⊔NoConfusion x y')) _) ⟩
                    inv x x (⊔NoConfusionSelf x)
                  ≡⟨ lem x ⟩
                    refl ∎
                  ) where

    lem : (x : A ⊔ B) → inv x x (⊔NoConfusionSelf x) ≡ refl
    lem (inl x) = refl
    lem (inr x) = refl

Path≡⊔NoConfusion : (x y : A ⊔ B) → (x ≡ y) ≡ ⊔NoConfusion x y
Path≡⊔NoConfusion x y = isoToPath (Path≅⊔NoConfusion x y)

isSet⊔ : {A B : Type} → isSet A → isSet B → isSet (A ⊔ B)
isSet⊔ hA hB x y = pathToFun (cong isProp (sym (Path≡⊔NoConfusion x y)))
                     (isSet⊔NoConfusion hA hB x y)

isSet⊔' : {A B : Type} → isSet A → isSet B → isSet (A ⊔ B)
isSet⊔' hA hB x y = endPt (λ A → isProp A) (sym (Path≡⊔NoConfusion x y))
                     (isSet⊔NoConfusion hA hB x y)

isSetℤ : isSet ℤ
isSetℤ = pathToFun (cong isSet (sym ℤ≡ℕ⊔ℕ)) (isSet⊔ isSetℕ isSetℕ)

isSetℤ' : isSet ℤ
isSetℤ' = endPt (λ A → isSet A) (sym ℤ≡ℕ⊔ℕ) (isSet⊔ isSetℕ isSetℕ)

