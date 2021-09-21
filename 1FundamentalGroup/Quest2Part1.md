# Comparison maps between `Ω S¹ base` and `ℤ`

## The `ℤ`-bundle `helix`

We want to make a `ℤ`-bundle over `S¹` by 
'copying ℤ across the loop via `sucℤPath`'.
In `Quest2.agda` locate

```agda
helix : S¹ → Type
helix = {!!}
```

Try to imitate the definition of `doubleCover` to define the bunlde `helix`.
You should compare your definition to ours in `Quest2Solutions.agda`.
Note that we have called this `helix`, since the picture of this `ℤ`-bundle 
looks like

<img src="images/helix.png"
     alt="helix"
     width="1000"
     class="center"/>

## Counting loops

Now we can do what was originally difficult - constructing an inverse map 
(over all points). 
Now we want to be able to count how many times a path `base ≡ base` loops around
`S¹`, which we can do now using `helix` and finding end points of 'lifted' paths.
For example the path `loop` should loop around once, 
counted by looking at the end point of 'lifted' `loop`, starting at `0`.
Hence try to define

```agda
spinCountBase : base ≡ base → helix base
spinCountBase = {!!}
```

Try computing a few values using `C-c C-n`,
you can try it on `refl`, `loop`, `loop 3 times`, `loop (- 1) times` and so on.

## Generalising

The function `spinCountBase`
can actually be improved without any extra work to a function on all of `S¹`

```agda
spinCount : (x : S¹) → base ≡ x → helix x
spinCount = {!!}
```

We will show that this and a general version of `loop_times` are
inverses of each other over `S¹`, in particular obtaining an isomorphism
between `base ≡ base` and `ℤ`.
