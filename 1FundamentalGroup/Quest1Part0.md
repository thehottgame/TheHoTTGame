# Loop Space

In this quest,
we continue to formalise the problem statement. 

> The fundamental group of `S¹` is `ℤ`. 

Intuitively, 
the fundamental group of `S¹` at `base` is
consists of loops based as `base` up to homotopy of paths.
In homotopy type theory, 
we have a native description of loops based at `base` : 
it is the space `base ≡ base`.

In general the _loop space_ of a space `A` at a point `a` is defined as follows :

```agda
Ω : (A : Type) (a : A) → Type
Ω A a = a ≡ a 
```

Warning : 
the loop space can contain higher homotopical information that
the fundamental group does not capture.
For example, consider `S²`.
```agda
data S² : Type where
  base : S²
  loop : base ≡ base
  northHemisphere : loop ≡ refl
  southHemisphere : refl ≡ loop
```

<p>
<details>
<summary>What is `refl`?</summary>

For any space `A` and point `a : A`, 
`refl` is the constant path at `a`.
Technically speaking, we should write `refl a` to indicate the point we are at,
however `agda` is often smart enough to figure that out.
</details>
</p>

Intuitively, all loops in `S²` based at `base` is homotopic to 
the constant path `refl`.
In other words, the fundamental group at `base` of `S²` is trivial.
However, the 'composition' of the path `southHemisphere` with `northHemisphere`
in `base ≡ base` gives the surface of `S²`,
which intuitively is not homotopic to the constant point `base`.
So `base ≡ base` has non-trivial path structure.
