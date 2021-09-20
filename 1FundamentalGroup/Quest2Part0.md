# Comparison maps between `Ω S¹ base` and `ℤ`

In `Quest1` we have defined the map `loop_times : ℤ → Ω S¹ base`.
Creating the inverse map is difficult without access to the entire circle.
Similarly to how we used `doubleCover` to distinguish `refl` and `base`,
the idea is to replace `Bool` with `ℤ`, 
allowing us to distinguish between all loops on `S¹`.

The plan is :

- Define a function `sucℤ : ℤ → ℤ` that increases every integer by one
- Prove that `sucℤ` is an isomorphism by constructing 
  an inverse map `predℤ : ℤ → ℤ`.
- Turn `sucℤ` into a path `sucPath : ℤ ≡ ℤ` using `isoToPath`
- Define `helix : S¹ → Type` by mapping `base` to `ℤ` and
  a generic point `loop i` to `sucPath i`.
- Use `helix` and `endPt` to define the map `base ≡ x → helix x`
  on all `x : S¹`, in particular giving us `Ω S¹ base → ℤ`
  when applied to `base`.
