module 1FundamentalGroup.Quest3Solutions where

open import 1FundamentalGroup.Preambles.P3

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
  ≡⟨ refl ⟩ -- how pathToFun interacts with →
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

windingNumberRewindBase : (n : ℤ) → windingNumber base (rewind base n) ≡ n
windingNumberRewindBase (pos zero) = refl
windingNumberRewindBase (pos (suc n)) =
    windingNumber base (rewind base (pos (suc n)))
  ≡⟨ refl ⟩
    windingNumber base (loop (pos n) times ∙ loop)
  ≡⟨ refl ⟩
    endPt helix (loop (pos n) times ∙ loop) (pos zero)
  ≡⟨ refl ⟩
    sucℤ (endPt helix (loop (pos n) times) (pos zero))
  ≡⟨ cong sucℤ (windingNumberRewindBase (pos n)) ⟩
    sucℤ (pos n)
  ≡⟨ refl ⟩
    pos (suc n) ∎
windingNumberRewindBase (negsuc zero) = refl
windingNumberRewindBase (negsuc (suc n)) = cong predℤ (windingNumberRewindBase (negsuc n))

-----------------------------------
  --   windingNumber base (rewind base n)
  -- ≡⟨ refl ⟩
  --   windingNumber base (loop n times)
  -- ≡⟨ refl ⟩
  --   endPt helix (loop n times) (pos zero)
  -- ≡⟨ {!!} ⟩
  --   n ∎
-------------------------------------

windingNumberRewind : (x : S¹) (n : helix x) → windingNumber x (rewind x n) ≡ n
windingNumberRewind = -- must case on x / use recursor / outOfS¹ since that is def of rewind
  outOfS¹D (λ x → (n : helix x) → windingNumber x (rewind x n) ≡ n)
    windingNumberRewindBase (
      pathToFun
        (λ i → (n : helix (loop i)) → windingNumber (loop i) (rewind (loop i) n) ≡ n)
        windingNumberRewindBase
    ≡⟨ funExt (λ x → isSetℤ _ _ _ _ ) ⟩ -- they are just functions so use funExt.
                                         -- two equalities in ℤ so must be equal by isSetℤ
      windingNumberRewindBase ∎)

-- must case on p / use recursor / J since that is def of windingNumber / endPt
-- actually endPt and J are both just transport in cubical agda.
rewindWindingNumber : (x : S¹) (p : base ≡ x) → rewind x (windingNumber x p) ≡ p
rewindWindingNumber x = J (λ x p → rewind x (windingNumber x p) ≡ p)
     (rewind base (windingNumber base refl)
   ≡⟨ refl ⟩
     loop_times (endPt helix (refl {x = base}) (pos zero)) -- reduce both definitions
   ≡⟨ cong loop_times (cong (λ g → g (pos zero)) (endPtRefl {x = base} helix)) ⟩
     loop (pos zero) times
   ≡⟨ refl ⟩
     refl ∎)

pathFibration≡helix : (x : S¹) → (base ≡ x) ≡ helix x
pathFibration≡helix x =
  isoToPath (iso (windingNumber x) (rewind x) (windingNumberRewind x) (rewindWindingNumber x))

loopSpaceS¹≡ℤ : loopSpace S¹ base ≡ ℤ
loopSpaceS¹≡ℤ = pathFibration≡helix base
