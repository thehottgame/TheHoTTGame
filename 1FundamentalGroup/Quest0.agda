module 1FundamentalGroup.Quest0 where

open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming ( Unit to ⊤ )
open import Cubical.Data.Bool
open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism
open import Cubical.Foundations.Path

private
  variable
    u : Level

data S¹ : Type where
  base : S¹
  loop : base ≡ base

-- if you don't know how to input a character
-- go to evil-mode, put your cursor on the character
-- and do `SPC h '`

¬ : Type u → Type u
¬ A = A → ⊥

_≢_ : {A : Type u} → (x y : A) → Type u
x ≢ y = ¬ (x ≡ y)

_≅_ = Iso

{- Bool

data Bool : Type where
  true : Bool
  false : Bool

The above definition for the Booleans
can be interpreted as

- a construction with only two recipes
  `true` and `false`
- a space with two points `true` and `false`.
  This space is discrete in the sense that
  we haven't specified any paths.

Our goal is to show

  refl ≢ loop (input \nequiv)

that there is path (aka homotopy) from `refl` to `loop`.
To do so we must assume there is such a path and derive
a contradiction.
The contradiction we will try to reach is that `true ≡ false`.
Indeed it does not hold:

-}


{- transport

To follow a point in `a : A` along a path `p : A ≡ B`
we use

  transport : {A B : Type u} → A ≡ B → A → B

Why do we propify? Discuss.

-}

true≢false' : true ≢ false
true≢false' h = transport ⊤≡⊥ tt where

  propify : Bool → Type
  propify false = ⊥
  propify true = ⊤

  ⊤≡⊥ : ⊤ ≡ ⊥
  ⊤≡⊥ = cong propify h



Flip : Bool → Bool
Flip false = true
Flip true = false

{- Iso

We show that Flip is an isomorphism from Bool → Bool
with inverse Flip.

A proof of `A ≅ B` (input \cong or write Iso A B) is given by

  iso f i s r

where

  f : A → B and i : B → A

are the map and its inverse,
here both `f` and `i` are Flip

`s` is a proof that `f` is a section with
right inverse `i` and
`r` is a proof that `f` is a retraction
with left inverse `i`

-}

flipIso : Bool ≅ Bool
flipIso = iso Flip Flip s r where
  s : section Flip Flip
  s false = refl
  s true = refl

  r : retract Flip Flip
  r false = refl
  r true = refl

{- Path ≡

A corollary of univalence is
`isoToPath` which takes an isomorphism
`f : A ≅ B` and gives a path
`fPath : A ≡ B`.
The resulting path has the important property
that when you follow (transport/subst)
a point in `A` along the path
you will get the point `f(a)` in `B`

-}

flipPath : Bool ≡ Bool
flipPath = isoToPath flipIso

{-

Try out `transport` on `true : Bool` and
`flipPath` by doing `C-c C-n`
and typing in `transport flipPath true`

-}

{- bundle over S¹

We want to construct a bundle over S¹
that looks like this:
-- insert image of double cover

to do so we use flipPath
to specify the fibers of the bundle
at each point on the `loop`.
These fibers must coincide at the end-points
with the fiber we set for `base`, which is `Bool`.

-}

-- the bundle
doubleCover : S¹ → Type
doubleCover base = Bool
doubleCover (loop i) = flipPath i

{- subst

Given a bundle `B : A → Type u`
over a space `A` and a path `p : x ≡ y`
between points in `x y : A`,

  subst : (B : A → Type u) (p : x ≡ y) → B x → B y

follows the path _over_ `p`, taking one
end point of the path in fiber `B x` to
the other end point in fiber `B y`.

We use `subst` to get a function that takes a path `p : base ≡ base`
and follows the point `true` in the fiber `doubleCover base`
along the path over `p` to some point in `doubleCover base`.

Note that `doubleCover base` is just `Bool` (externally).

-}

SubstTrue : (p : base ≡ base) → doubleCover base
SubstTrue p = subst doubleCover p true

{-

You can check that `SubstTrue refl` and `SubstTrue loop`
are using `C-c C-n`

-}

{- cong

Given a function `f : A → B`
and a path `p : x ≡ y` between points `x y : A`

  cong : (f : A → B) → (p : x ≡ y) → f x ≡ f y

gives us a path in `B` from `f x` to `f y`

We can use the above to get the contradiction we want
by

- assuming `p : refl ≡ loop`
- deducing `SubstTrue refl ≡ SubstTrue loop` using `cong`

-}

refl≢loop : refl ≢ loop
refl≢loop p = true≢false (cong SubstTrue p)
