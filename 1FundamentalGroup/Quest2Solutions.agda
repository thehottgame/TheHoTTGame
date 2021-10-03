-- ignore
module 1FundamentalGroup.Quest2Solutions where
open import 1FundamentalGroup.Preambles.P2


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

∙refl : {A : Type} {x y : A} (p : x ≡ y) → p ∙ refl ≡ p
∙refl = J (λ y p → p ∙ refl ≡ p) refl∙refl

refl∙ : {A : Type} {x y : A} (p : x ≡ y) → refl ∙ p ≡ p
refl∙ = J (λ y p → refl ∙ p ≡ p) refl∙refl

∙sym : {A : Type} {x y : A} (p : x ≡ y) → p ∙ sym p ≡ refl
∙sym = J (λ y p → p ∙ sym p ≡ refl)
       (
         refl ∙ sym refl
       ≡⟨ cong (λ p → refl ∙ p) symRefl ⟩
         refl ∙ refl
       ≡⟨ refl∙refl ⟩
         refl ∎)

sym∙ : {A : Type} {x y : A} (p : x ≡ y) → (sym p) ∙ p ≡ refl
sym∙ = J (λ y p → (sym p) ∙ p ≡ refl)
       (
         (sym refl) ∙ refl
       ≡⟨ cong (λ p → p ∙ refl) symRefl ⟩
         refl ∙ refl
       ≡⟨ refl∙refl ⟩
         refl ∎)

assoc : {A : Type} {w x : A} (p : w ≡ x) {y z : A} (q : x ≡ y) (r : y ≡ z)
        → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r)
assoc {A} = J
        -- casing on p
        (λ x p → {y z : A} (q : x ≡ y) (r : y ≡ z) → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r))
        -- reduce to showing when p = refl
        λ q r →  (refl ∙ q) ∙ r
                 ≡⟨ cong (λ p' → p' ∙ r) (refl∙ q) ⟩
                  q ∙ r
                 ≡⟨ sym (refl∙ (q ∙ r)) ⟩
                  refl ∙ q ∙ r ∎
