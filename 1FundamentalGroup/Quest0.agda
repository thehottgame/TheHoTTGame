module 1FundamentalGroup.Quest0 where

open import Cubical.Data.Empty
open import Cubical.Data.Unit renaming ( Unit to ⊤ )
open import Cubical.Data.Bool
open import Cubical.Foundations.Prelude renaming ( subst to endPt )
open import Cubical.Foundations.Isomorphism renaming ( Iso to _≅_ )
open import Cubical.Foundations.Path

data S¹ : Type where
  base : S¹
  loop : base ≡ base

Refl : base ≡ base
Refl = λ i → base

{- transport

To follow a point in `a : A` along a path `p : A ≡ B`
we use

  transport : {A B : Type u} → A ≡ B → A → B

Why do we propify? Discuss.

-}

Flip : Bool → Bool
Flip false = true
Flip true = false

flipIso : Bool ≅ Bool
flipIso = iso Flip Flip s r where
  s : section Flip Flip
  s false = refl
  s true = refl

  r : retract Flip Flip
  r false = refl
  r true = refl

flipPath : Bool ≡ Bool
flipPath = isoToPath flipIso

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

endPtOfTrue : (p : base ≡ base) → doubleCover base
endPtOfTrue p = endPt doubleCover p true

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

refl≢loop : refl ≡ loop → ⊥
refl≢loop p = true≢false (cong endPtOfTrue p)
