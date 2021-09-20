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
Locate `loop_times` in `1FundamentalGroup/Quest1.agda`
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

```agda
sym : x ≡ y → y ≡ x
```

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

