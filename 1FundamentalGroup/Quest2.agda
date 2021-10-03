-- ignore
module 1FundamentalGroup.Quest2 where
open import 1FundamentalGroup.Preambles.P2

data _⊔_ (A B : Type) : Type where

     inl : A → A ⊔ B
     inr : B → A ⊔ B

ℤ≡ℕ⊔ℕ : ℤ ≡ ℕ ⊔ ℕ
ℤ≡ℕ⊔ℕ = {!!}

∙refl : {A : Type} {x y : A} (p : x ≡ y) → p ∙ refl ≡ p
∙refl = {!!}

refl∙ : {A : Type} {x y : A} (p : x ≡ y) → refl ∙ p ≡ p
refl∙ = {!!}

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
