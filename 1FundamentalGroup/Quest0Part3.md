# `refl ≡ loop` is empty - transporting paths using the double cover

By the end of this page we will have shown that 
`refl ≡ loop` is an empty space,
we start at the end, moving backwards to what we need,
as we would often do in practice.

In `Quest0.agda` you should see

```agda
Refl≢loop : Refl ≡ loop → ⊥
Refl≢loop h = ?
```

In the library we have 
`true≢false : true ≡ false → ⊥`
which says that the space of paths in `Bool`
from `true` to `false` is empty.
We will assume it here and leave it as a side quest,
see `1FundamentalGroup/Quest0SideQuests/SideQuest0`.

- Load the file with `C-c C-l` and navigate to the hole.
- Write `true≢false` in the hole and refine using `C-c C-r`,
  `agda` knows `true≢false` maps to `⊥` so it automatically
  will make a new hole.
- Check the goal in the new hole using `C-c C-,`
  it should be asking for a path from `true` to `false`.

To give this path we need to visualise 'lifting' `Refl` and `loop`
along the Boolean-bundle `doubleCover`.
When we 'lift' `Refl` - starting at the point `true : doubleCover base` -
it will still be a constant path at `true`,
which we can just draw as a dot `true`.
When we 'lift' `loop` - starting at the point `true : doubleCover base` -
it will look like

 <!-- [insert picture] -->

We can find the end points of both 'lifted paths' by using `subst`.
We should be able to see that the end point of the 'lifted' 
`Refl` is just `true` and the end point of the 'lifted' `loop` is `false`.
Now a homotopy `h : refl ≡ loop` is 'lifted' to some kind of surface 

<!-- [insert picture] -->

The end points of each 'lifted paths' in the 'lifted homotopy' 
form a path in the endpoint fiber `doubleCover base`
from the endpoint of 'lifted `Refl`' to the endpoint of 'lifted `base`',
i.e. a path from `true` to `false` in `Bool`, which is what we need.

We use `endPt` to pick out the end points of 'lifted paths', 
given to us in the library (originally called `subst`):

```agda
endPt : (B : A → Type) (p : x ≡ y) (bx : B x) → B y
```

It says given a bundle `B` over space `A`, 
a path `p` from `x : A` to `y : A`, and
a point `bx` above `x`,
we can get the end point of 'lifted `p` starting at `bx`'.
So let's make the function that takes
a path from `base` to `base` and spits out the end point 
of the 'lifted path'.

```agda
endPtOfTrue : (p : base ≡ base) → doubleCover base
endPtOfTrue p = ?
```

Try filling in `endPtOfTrue` using `endPt` 
and the skills you have developed so far.
You can check that `endPtOfTrue Refl` is `true`
and that `endPtOfTrue loop` is `false` using `C-c C-n`.

Lastly we need to make the function `endPtOfTrue`
take the path `h : refl ≡ loop` to a path from `true` to `false`.
In general if `f : A → B` is a function and `p` is a path
between points `x y : A` then we get a map `cong f p`
from `f x` to `f y`.
(Note that `p` here is actually a homotopy `h`.)

```agda
cong : (f : A → B) → (p : x ≡ y) → f x ≡ f y
```

Using `cong` and `endPtOfTrue` you should be able to complete Quest0.
