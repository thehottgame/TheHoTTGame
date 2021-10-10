module 1FundamentalGroup.Shelf.questExtras where

open import Cubical.Foundations.Prelude
open import Cubical.HITs.S1
open import Cubical.Data.Empty
open import 1FundamentalGroup.Quest0Solutions

-- ¬isSetS¹ : isSet S¹ → ⊥
-- ¬isSetS¹ = {!!}

-- ¬isPropS¹ : isProp S¹ → ⊥
-- ¬isPropS¹ = {!!}

-------------solutions------
¬isSetS¹ : isSet S¹ → ⊥
¬isSetS¹ h = Refl≢loop (h base base Refl loop)

¬isPropS¹ : isProp S¹ → ⊥
¬isPropS¹ h = ¬isSetS¹ (isProp→isSet h)


------------J exercises----------------

private
  variable
    A B : Type

Cong : {x y : A} (f : A → B) → x ≡ y → f x ≡ f y
Cong {A} {B} {x} f = J (λ y p → f x ≡ f y) refl

Sym : {x y : A} → x ≡ y → y ≡ x
Sym {A} {x} = J (λ y1 p → y1 ≡ x) refl

SymRefl : {x : A} → Sym {A} {x} {x} (refl) ≡ refl
SymRefl {A} {x} = JRefl (λ y1 p → y1 ≡ x) refl

Trans : {x y z : A} → x ≡ y → y ≡ z → x ≡ z
Trans {x = x} {z = z} = J (λ y1 p → y1 ≡ z → x ≡ z) λ q → q

_⋆_ = Trans -- input \*

TransRefl : {x y : A} → Trans {A} {x} {x} {y} refl ≡ λ q → q
TransRefl {x = x} {y = y} = JRefl ((λ y1 p → y1 ≡ y → x ≡ y)) λ q → q

refl⋆refl : {x : A} → refl {_} {A} {x} ⋆ refl ≡ refl
refl⋆refl = Cong (λ f → f refl) TransRefl

⋆refl : {x y : A} (p : x ≡ y) → Trans p refl ≡ p
⋆refl {A} {x} {y} = J (λ y p → Trans p refl ≡ p) refl⋆refl

refl⋆ : {A : Type} {x y : A} (p : x ≡ y) → refl ⋆ p ≡ p
refl⋆ = J (λ y p → refl ⋆ p ≡ p) refl⋆refl


⋆Sym : {A : Type} {x y : A} (p : x ≡ y) → p ⋆ Sym p ≡ refl
⋆Sym = J (λ y p → p ⋆ Sym p ≡ refl)
       (
         refl ⋆ Sym refl
       ≡⟨ cong (λ p → refl ⋆ p) SymRefl ⟩
         refl ⋆ refl
       ≡⟨ refl⋆refl ⟩
         refl ∎
       )


Sym⋆ : {A : Type} {x y : A} (p : x ≡ y) → (Sym p) ⋆ p ≡ refl
Sym⋆ = J (λ y p → (Sym p) ⋆ p ≡ refl)
       (
         (Sym refl) ⋆ refl
       ≡⟨ cong (λ p → p ⋆ refl) SymRefl ⟩
         refl ⋆ refl
       ≡⟨ refl⋆refl ⟩
         refl ∎
       )

Assoc : {A : Type} {w x : A} (p : w ≡ x) {y z : A} (q : x ≡ y) (r : y ≡ z)
        → (p ⋆ q) ⋆ r ≡ p ⋆ (q ⋆ r)
Assoc {A} = J
        -- casing on p
        (λ x p → {y z : A} (q : x ≡ y) (r : y ≡ z) → (p ⋆ q) ⋆ r ≡ p ⋆ (q ⋆ r))
        -- reduce to showing when p = refl
        λ q r →  ((refl ⋆ q) ⋆ r)
                 ≡⟨ cong (λ p' → p' ⋆ r) (refl⋆ q) ⟩
                  (q ⋆ r)
                 ≡⟨ Sym (refl⋆ (q ⋆ r)) ⟩
                  (refl ⋆ (q ⋆ r)) ∎


-------------original-------------------


-- ∙refl : {A : Type} {x y : A} (p : x ≡ y) → p ∙ refl ≡ p
-- ∙refl = J (λ y p → p ∙ refl ≡ p) refl∙refl

-- refl∙ : {A : Type} {x y : A} (p : x ≡ y) → refl ∙ p ≡ p
-- refl∙ = J (λ y p → refl ∙ p ≡ p) refl∙refl

-- ∙sym : {A : Type} {x y : A} (p : x ≡ y) → p ∙ sym p ≡ refl
-- ∙sym = J (λ y p → p ∙ sym p ≡ refl)
--        (
--          refl ∙ sym refl
--        ≡⟨ cong (λ p → refl ∙ p) symRefl ⟩
--          refl ∙ refl
--        ≡⟨ refl∙refl ⟩
--          refl ∎)

-- sym∙ : {A : Type} {x y : A} (p : x ≡ y) → (sym p) ∙ p ≡ refl
-- sym∙ = J (λ y p → (sym p) ∙ p ≡ refl)
--        (
--          (sym refl) ∙ refl
--        ≡⟨ cong (λ p → p ∙ refl) symRefl ⟩
--          refl ∙ refl
--        ≡⟨ refl∙refl ⟩
--          refl ∎)

-- assoc : {A : Type} {w x : A} (p : w ≡ x) {y z : A} (q : x ≡ y) (r : y ≡ z)
--         → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r)
-- assoc {A} = J
--         -- casing on p
--         (λ x p → {y z : A} (q : x ≡ y) (r : y ≡ z) → (p ∙ q) ∙ r ≡ p ∙ (q ∙ r))
--         -- reduce to showing when p = refl
--         λ q r →  (refl ∙ q) ∙ r
--                  ≡⟨ cong (λ p' → p' ∙ r) (refl∙ q) ⟩
--                   q ∙ r
--                  ≡⟨ sym (refl∙ (q ∙ r)) ⟩
--                   refl ∙ q ∙ r ∎
