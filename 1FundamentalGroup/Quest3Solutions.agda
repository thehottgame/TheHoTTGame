module 1FundamentalGroup.Quest3Solutions where

open import Cubical.HITs.S1 using ( S¹ ; base ; loop )
open import 1FundamentalGroup.Quest1Solutions
open import Cubical.Foundations.Prelude
  renaming (transport to pathToFun ; transportRefl to pathToFunRefl)
open import Cubical.Foundations.GroupoidLaws
  renaming (lCancel to sym∙ ; rCancel to ∙sym ; lUnit to Refl∙ ; rUnit to ∙Refl)
open import Cubical.Foundations.Path
open import 0Trinitarianism.Quest5Solutions
open import Cubical.Data.Int using (ℤ)
open import Cubical.Data.Nat

pathToFun→ : {A0 A1 B0 B1 : Type} (A : A0 ≡ A1) (B : B0 ≡ B1) (f : A0 → B0) →
  pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1))
pathToFun→ A B f =
  J (λ A1 A → pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1)))
  refl A



{-

private
  variable
    ℓ : Level

transport→ : {A B : I → Type ℓ} (f : A i0 → B i0) (x : A i0) →
  transport (λ i → A i → B i) f (transport (λ i → A i) x) ≡ transport (λ i → B i) (f x)
transport→ {A = A} {B = B} f x =
  J
  (λ A1 A →
    transport (λ i → A i → B i) f (transport (λ i → A i) x) ≡ transport (λ i → B i) (f x))
  (J
    (λ B1 B →
      transport (λ i → A i0 → B i) f (transport (λ i → A i0) x) ≡ transport (λ i → B i) (f x))
   (
       transport (λ i → A i0 → B i0) f (transport (λ i → A i0) x)
     ≡⟨ cong (transport (λ i → A i0 → B i0) f) (transportRefl x) ⟩
       transport (λ i → A i0 → B i0) f x
     ≡⟨ cong (λ g → g x) (transportRefl f) ⟩
       f x
     ≡⟨ sym (transportRefl (f x)) ⟩
       transport (λ i → B i0) (f x) ∎
   )
    λ i → B i
  )
  λ i → A i
  -- J (λ A1 A → transport (λ i → A i → B i) f ≡ λ a1 → transport B (f (transport (sym A) a1)))
  -- (funExt (λ a1 → refl)) A

transport→' : {A0 A1 B0 B1 : Type} {A : A0 ≡ A1} {B : B0 ≡ B1} (f : A0 → B0) →
  transport (λ i → A i → B i) f ≡ λ a1 → transport B (f (transport (sym A) a1))
transport→' {A = A} {B = B} f =
  J (λ A1 A → transport (λ i → A i → B i) f ≡ λ a1 → transport B (f (transport (sym A) a1)))
  refl A

pathToFun→ : {A0 A1 B0 B1 : Type} {A : A0 ≡ A1} {B : B0 ≡ B1} (f : A0 → B0) →
  pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1))
pathToFun→ {A = A} {B = B} f =
  J (λ A1 A → pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1)))
  refl A

pathToFun→' : {A0 A1 B0 B1 : Type} {A : A0 ≡ A1} {B : B0 ≡ B1} (f : A0 → B0) →
  pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1))
pathToFun→' {A0} {A1} {B0} {B1} {A} {B} f =
  J (λ A1 A → pathToFun (λ i → A i → B i) f ≡ λ a1 → pathToFun B (f (pathToFun (sym A) a1)))
  (
    J (λ B1 B → pathToFun (λ i → A0 → B i) f ≡ λ a → pathToFun B (f (pathToFun refl a)))
    (
      funExt λ a →
        pathToFun refl f a
      ≡⟨ cong (λ g → g a) (pathToFunRefl f) ⟩
        f a
      ≡⟨ sym (pathToFunRefl (f a)) ⟩
        pathToFun refl (f a)
      ≡⟨ cong (λ x → pathToFun refl (f x)) (sym (pathToFunRefl a)) ⟩
        pathToFun refl (f (pathToFun refl a)) ∎
    )
    B
  )
  A -}

open ℤ

loopSucℤtimes : (n : ℤ) → loop n times ∙ loop ≡ loop sucℤ n times
loopSucℤtimes (pos n) = refl
loopSucℤtimes (negsuc zero) = sym∙ loop
loopSucℤtimes (negsuc (suc n)) =
    (loop (negsuc n) times ∙ sym loop) ∙ loop
  ≡⟨ sym (assoc _ _ _) ⟩
    loop (negsuc n) times ∙ (sym loop ∙ loop)
  ≡⟨ cong (λ p → loop (negsuc n) times ∙ p) (sym∙ _) ⟩
    loop (negsuc n) times ∙ refl
  ≡⟨ sym (∙Refl _) ⟩
    loop (negsuc n) times ∎

sucℤPredℤ : (n : ℤ) → sucℤ (predℤ n) ≡ n
sucℤPredℤ (pos zero) = refl
sucℤPredℤ (pos (suc n)) = refl
sucℤPredℤ (negsuc n) = refl

pathToFunPathFibration : {A : Type} {x y z : A} (q : x ≡ y) (p : y ≡ z) →
  pathToFun (λ i → x ≡ p i) q ≡ q ∙ p
pathToFunPathFibration {A} {x} {y} q = J (λ z p → pathToFun (λ i → x ≡ p i) q ≡ q ∙ p)
  (
    pathToFun refl q
  ≡⟨ pathToFunRefl q ⟩
    q
  ≡⟨ ∙Refl q ⟩
    q ∙ refl ∎
  )

rewind : (x : S¹) → helix x → base ≡ x
rewind = outOfS¹D (λ x → helix x → base ≡ x) loop_times
  (
    pathToFun (λ i → sucℤPath i → base ≡ loop i) loop_times
  ≡⟨ pathToFun→ sucℤPath (λ i → base ≡ loop i) loop_times ⟩ -- how pathToFun interacts with →
    (λ n → pathToFun (λ i → base ≡ loop i) (loop_times (pathToFun (sym sucℤPath) n)))
  ≡⟨ refl ⟩ -- sucℤPath is just taking successor, and so its inverse is definitionally taking predecessor
    (λ n → pathToFun (λ i → base ≡ loop i) (loop_times (predℤ n)))
  ≡⟨ funExt (λ n → pathToFunPathFibration _ _) ⟩ -- how pathToFun interacts with the "path fibration"
    (λ n → (loop (predℤ n) times) ∙ loop)
  ≡⟨ funExt (λ n →
       loop predℤ n times ∙ loop
      ≡⟨ loopSucℤtimes (predℤ n) ⟩
        loop (sucℤ (predℤ n)) times
      ≡⟨ cong loop_times (sucℤPredℤ n) ⟩
        loop n times ∎) ⟩
    loop_times ∎
  )


