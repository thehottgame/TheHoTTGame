# Comparison maps between `Ω S¹ base` and `ℤ`

In `Quest1` we have defined the map `loop_times : ℤ → Ω S¹ base`.
Creating the inverse map is difficult without access to the entire circle.
Similarly to how we used `doubleCover` to distinguish `refl` and `base`,
the idea is to replace `Bool` with `ℤ`, 
allowing us to distinguish between all loops on `S¹`.

The plan is :

1. Define a function `sucℤ : ℤ → ℤ` that increases every integer by one
2. Prove that `sucℤ` is an isomorphism by constructing 
   an inverse map `predℤ : ℤ → ℤ`.
3. Turn `sucℤ` into a path `sucPath : ℤ ≡ ℤ` using `isoToPath`
4. Define `helix : S¹ → Type` by mapping `base` to `ℤ` and
   a generic point `loop i` to `sucPath i`.
5. Use `helix` and `endPt` to define the map 
   `spinCountBase : base ≡ base → ℤ`
   Intuitively it counts how many times a path loops around `S¹`. 
   a generic point `loop i` to `sucPath i`.
6. Generalize this across the circle.

In this part, we focus on `1`, `2` and `3`.

## `sucℤ`

- Setup the definition of `sucℤ` so that it looks of the form : 
  ```agda
  Name : TypeOfSpace
  Name inputs = ?
  ```
  
  Compare it with our solutions in `1FundamentalGroup/Quest1.agda`
- We will define `sucℤ` the same way we defined `loop_times` : 
  by induction.
  Do cases on the input of `sucℤ`.
  You should have something like :
  ```agda
  sucℤ : ℤ → ℤ
  sucℤ pos n = ?
  sucℤ negsuc n = ?
  ```
- For the non-negative integers `pos n` we want to map to its successor.
  Recall that the `n` here is a point of the naturals `ℕ` whose definition is :
  ```agda
  data ℕ : Type where
    zero : ℕ
    suc : ℕ → ℕ
  ```
  Use `suc` to map `pos n` to its successor.
- The negative integers require a bit more care.
  Recall that annoyingly `negsuc n` means "`- (n + 1)`".
  We want to map `- (n + 1)` to `- n`.
  Try doing this. 
  Then realise "you run out of negative integers at `-(0 + 1)`"
  so you must do cases on `n` and treat the `-(0 + 1)` case separately.
  <p>
  <details>
  <summary>Hint</summary>
  
  Do `C-c C-c` on `n`.
  Then map `negsuc 0` to `pos 0`. 
  For `negsuc (suc n)`, map it to `negsuc n`.
  
  </details>
  </p>
- This completes the definition of `sucℤ`.
  Use `C-c C-n` to check it computes correctly.
  E.g. check that `sucℤ (- 1)` computes to `pos 0`
  and `sucℤ (pos 0)` computes to `pos 1`.
  
## `sucℤ` is an isomorphism

- The goal is to define `predℤ : ℤ → ℤ` which 
  "takes `n` to its predecessor `n - 1`".
  This will act as the (homotopical) inverse of `sucℤ`.
  Now that you have experience from defining `sucℤ`,
  try defining `predℤ`.
- Imitating what we did with `flipIso` and 
  give a point `sucℤIso : ℤ ≅ ℤ`
  by using `predℤ` as the inverse and proving
  `section sucℤ predℤ` and `retract sucℤ predℤ`. 

## `sucℤ` is a path

- Imitating what we did with `flipPath`, 
  upgrade `sucℤIso` to `sucℤPath`.
