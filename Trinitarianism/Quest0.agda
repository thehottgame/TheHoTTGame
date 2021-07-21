module Trinitarianism.Quest0 where
open import Trinitarianism.Quest0Preamble

private
  postulate
    u : Level


{-
There are three ways of looking at `A : Type u`.
  - proof theoretically, '`A` is a proposition'
  - type theoretically, '`A` is a construction'
  - categorically, '`A` is an object in category `Type u`'

We will explain what u : Level and Type u is at the end.

A first example of a type construction is the function type.
Given types `A` and `B`, we have another type `A → B` which can be seen as
  - the proposition '`A` implies `B`'
  - the construction 'ways to convert `A` recipes to `B` recipes'
  - internal hom of the category `Type u`

To give examples of this, let's make some types first!
-}

-- Here is how we define 'true'
data ⊤ : Type u where
  trivial : ⊤

{-

It reads '`⊤` is an inductive type with a constructor `trivial`',
with three interpretations
  - `⊤` is a proposition and there is a proof of it, called `trivial`.
  - `⊤` is a construction with a recipe called `trivial`
  - `⊤` is a terminal object: every object has a morphism into `⊤` given by `· ↦ trivial`

The above tells you how we _make_ a term of type `⊤`,
let's see an example of _using_ a term of type `⊤`:
-}

TrueToTrue : ⊤ → ⊤
TrueToTrue = {!!}

{-
  - press `C-c C-l` (this means `Ctrl-c Ctrl-l`) to load the document,
    and now you can fill the holes
  - navigate to the hole `{ }` using `C-c C-f` (forward) or `C-c C-b` (backward)
  - press `C-c C-r` and agda will try to help you (r for refine)
  - you should see `λ x → { }`
  - navigate to the new hole
  - `C-c C-,` to check the goal (`C-c C-comma`)
  - the Goal area should look like

  ```
  Goal: ⊤
  —————————————————————————
  x : ⊤
  ```

  - you have a proof/recipe/generalized element `x : ⊤`
  and you need to give a p/r/g.e. of `⊤`
  - you can give it a p/r/g.e. of `⊤` and press `C-c C-SPC` to fill the hole

There is more than one proof (see solutions) - are they the same?
Here is an important one:
-}
TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = {!!}

{-

  - Naviagate to the hole and check the goal.
  - Note `x` is already taken out for you.
  - You can try type `x` in the hole and `C-c C-c`
  - `c` stands for 'cases on `x`' and the only case is `trivial`.

Built into the definition of `⊤` is agda's way of making a map out of ⊤
into another type A, which we have just used.
It says to map out of ⊤ it suffices to do the case when `x` is `trivial`, or
  - the only proof of `⊤` is `trivial`
  - the only recipe for `⊤` is `trivial`
  - the only one generalized element `trivial` in `⊤`
-}



-- Here is how we define 'false'
data ⊥ : Type u where

{-

It reads '`⊥` is an inductive type with no constructors',
with three interepretations
  - `⊥` is a proposition with no proofs
  - `⊥` is a construction with no recipes
  - There are no generalized elements of `⊥` (it is a strict initial object)

Let's try mapping out of `⊥`.
-}

explosion : ⊥ → ⊤
explosion x = {!!}

{-

  - Navigate to the hole and do cases on `x`.

Agda knows that there are no cases so there is nothing to do!
This has three interpretations:
  - false implies anything (principle of explosion)
  - ?
  - ⊥ is initial in the category `Type u`

-}

{-
We can also encode "natural numbers" as a type.
-}
data ℕ : Type where
  zero : ℕ
  suc : ℕ → ℕ
{-
As a construction, this reads '
  - ℕ is a type of construction
  - `zero` is a recipe for ℕ
  - `suc` takes an existing recipe for ℕ and gives
      another recipe for ℕ.
  '

We can see `ℕ` as a categorical notion:
ℕ is a natural numbers object in the category `Type u`,
with `zero : ⊤ → ℕ` and `suc : ℕ → ℕ` such that
given any `⊤ → A → A` there exist a unique morphism `ℕ → A`
such that the diagram commutes:


This has no interpretation as a proposition since
there are too many terms,
since mathematicians classically didn't distinguish
between proofs of the same thing.
(ZFC doesn't even mention logic internally,
unlike Type Theory!)




-}

postulate
  A : Type u

NNO : A → (A → A) → (ℕ → A)
NNO a s zero = a
NNO a s (suc n) = s (NNO a s n)















{-
Let's assume we have the following the naturals ℕ
and try to define the 'predicate on ℕ' given by 'x is 0'
-}
isZero : ℕ → Type u
isZero zero = {!!}
isZero (suc n) = {!!}

{-
Here's how:
  * when x is zero, we give the proposition ⊤
  (try typing it in by writing \top then pressing C-c C-SPC)
  * when x is suc n (i.e. 'n + 1', suc for successor) we give ⊥ (\bot)
This is technically using induction - see AsTypes.

In general a 'predicate on ℕ' is just a 'function' P : ℕ → Type u
-}

{-
You can check if zero is indeed zero by clicking C-c C-n,
which brings up a thing on the bottom saying 'Expression',
and you can type the following
isZero zero
isZero (suc zero)
isZero (suc (suc zero))
...
-}

{-
We can prove that 'there exists a natural number that isZero'
in set theory we might write
  ∃ x ∈ ℕ, x = 0
which in agda noation is
  Σ ℕ isZero

In general if we have predicate P : ℕ → Type u we would write
  Σ ℕ P
for
  ∃ x ∈ ℕ, P x

To formulate the result Σ ℕ isZero we need to define
a proof of it
-}
ExistsZero : Σ ℕ isZero
ExistsZero = {!!}

{-
To fill the hole, we need to give a natural and a proof that it is zero.
Agda will give the syntax you need:
  * navigate to the correct hole then refine using C-c C-r
  * there are now two holes - but which is which?
  * navigate to the first holes and type C-c C-,
    - for the first hole it will ask you to give it a natural 'Goal: ℕ'
    - for the second hole it will ask you for a proof that
    whatever you put in the first hole is zero 'Goal: isZero ?0' for example
  * try to fill both holes, using C-c C-SPC as before
  * for the second hole you can try also C-c C-r,
    Agda knows there is an obvious proof!
-}

{-
Let's show 'if all natural numbers are zero then we have a contradiction',
where 'a contradiction' is a proof of ⊥.
In maths we would write
  (∀ x ∈ ℕ, x = 0) → ⊥
and the agda notation for this is
  ((x : ℕ) → isZero x) → ⊥

In general if we have a predicate P : ℕ → Prop then we write
  (x : ℕ) → P x
to mean
  ∀ x ∈ ℕ, P x
-}

AllZero→⊥ : ((x : ℕ) → isZero x) → ⊥
AllZero→⊥ = {!!}

{-
Here is how we prove it in maths
  * assume hypothesis h, a proof of (x : ℕ) → isZero x
  * apply the hypothesis h to 1, deducing isZero 1, i.e. we get a proof of isZero 1
  * notice isZero 1 IS ⊥

Here is how you can prove it here
  * navigate to the hole and check the goal
  * to assume the hypothesis (x : ℕ) → isZero x,
    type an h in front like so
    AllZero→⊥ h = { }
  * now do
    * C-c C-l to load the file
    * navigate to the new hole and check the new goal
  * type h in the hole, type C-c C-r
  * this should give h { }
  * navigate to the new hole and check the Goal
  * Explanation
    * (h x) is a proof of isZero x for each x
    * it's now asking for a natural x such that isZero x is ⊥
  * Try filling the hole with 0 and 1 and see what Agda says
-}

{-
Let's try to show the mathematical statement
'any natural n is 0 or not'
but we need a definition of 'or'
-}
data OR (P Q : Type u) : Type u where
  left : P → OR P Q
  right : Q → OR P Q
{-
This reads
  * Given propositions P and Q we have another proposition P or Q
  * There are two ways of proving P or Q
    * given a proof of P, left sends this to a proof of P or Q
    * given a proof of Q, right sends this to a proof of P or Q

Agda supports nice notation using underscores.
-}

data _∨_ (P Q : Type u) : Type u where
  left : P → P ∨ Q
  right : Q → P ∨ Q

{-
[Important note]
Agda is sensitive to spaces so these are bad

data _ ∨ _ (P Q : Prop) : Prop where
  left : P → P ∨ Q
  right : Q → P ∨ Q

data _∨_ (P Q : Prop) : Prop where
  left : P → P∨Q
  right : Q → P∨Q

it is also sensitive to indentation so these are also bad

data _∨_ (P Q : Prop) : Prop where
left : P → P ∨ Q
right : Q → P ∨ Q

-}

{-
Now we can prove it!
This technically uses induction - see AsTypes.
Fill the missing part of the theorem statement.
You need to first uncomment this by getting rid of the -- in front (C-x C-;)
-}
-- DecidableIsZero : (n : ℕ) → {!!}
-- DecidableIsZero zero = {!!}
-- DecidableIsZero (suc n) = {!!}

-- TODO terms and types
-- TODO universe levels
