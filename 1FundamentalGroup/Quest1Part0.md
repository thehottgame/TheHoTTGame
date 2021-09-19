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

Clearly for each integer `n : ℤ` we have a path 
that is '`loop` around `n` times'.
Locate `loop_times` in the `Quest1.agda`
(note how `agda` treats underscores)

```agda
loop_times : ℤ → Ω S¹ base
loop n times = {!!}
```

Try casing on `n`, you should see

```agda
loop_times : ℤ → Ω S¹ base
loop pos n times = {!!}
loop negsuc n times = {!!}
```

It says to map out of `ℤ` it suffices to 
map the non-negative integers (`pos`) 
and the negative integers (`negsuc`).

```agda
data ℤ : Type where
  pos    : (n : ℕ) → ℤ
  negsuc : (n : ℕ) → ℤ
```

This definition of `ℤ` uses the naturals, so try
casing on `n` again, you should see

```agda
loop_times : ℤ → Ω S¹ base
loop pos zero times = {!!}
loop pos (suc n) times = {!!}
loop negsuc n times = {!!}
```

It says to map out of `ℕ` it suffices to map `zero` and 
map each succesive integer `suc n` inductively.
When we loop `zero` (`pos zero`) times what should we get?
Try filling it in.
For looping `pos (suc n)` times we loop `n` times and 
loop once more.
For this we need composition of paths.

```agda
_∙_ : x ≡ y → y ≡ z → x ≡ z
```

Try typing `_∙_` or `? ∙ ?` in the hole (input `/.`)
and refining.
Checking the new holes you should see that now you need 
to give two loops.
Try giving it '`loop n times`' composed with `loop`.
Then try to also define the map on the negative integers.
You will need to invert paths using `sym`.

<p>
<details>
<summary>Looking up definitions</summary>

If you don't know the definition of something 
you can look up the definition by sticking your cursor
on it and pressing `M-SPC c d` in _insert mode_
or `SPC c d` in _evil mode_.

You can use it to find out the definition of `ℤ` and `ℕ`.

</details>
</p>

<!-- Next level -->


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

<img src="images/S2.png" 
     alt="S2" 
     width="500"
     class="center"/>

Let's be more precise about homotopical data : 
We can check that a space is 'homotopically trivial' (h-trivial) 
from dimension `n`
by checking if spheres of dimension `n` can be filled.
To be h-trivial from `0` is for any two points
to have a line in between; to fill `S⁰`. 
This data is captured in 

```agda
isProp : Type → Type 
isProp A = (x y : A) → x ≡ y
```

<p>
<details>
<summary>All maps are continuous in HoTT</summary>

There is a subtlety in the definition `isProp`.
This is _stronger_ than saying that the space `A` is path connected.
Since `A` is equipped with a continuous map taking pairs `x y : A`
to a path between them. 

We will show that `isProp S¹` is _empty_ despite `S¹` being path connected. 

</details>
</p>

Similarly, to be h-trivial from `1` is for any two points `x y : A`
and any two paths `p q : x ≡ y` to have a homotopy from `p` to `q`;
to fill `S¹`. This is captured in

```agda
isSet : Type → Type
isSet A = (x y : A) → isProp (x ≡ y)
```

We may therefore want to remove homotopical data 
beyond a certain dimension.
We define the fundamental group to be 
the homotopical data of `S¹` up to (and 
including) dimension `1`, i.e. 
the homotopical data of the loop space of `S¹`
up to dimension `0`.

We make the definitions for a space to 
have homotopical data only up to dimension `0`
and `1` respectively


```agda
isProp : Type → Type 
isProp A = (x y : A) → x ≡ y

isSet : Type → Type
isSet A = (x y : A) → isProp (x ≡ y)

isProp→isSet : (A : Type) → isProp A → isSet A
``` 
