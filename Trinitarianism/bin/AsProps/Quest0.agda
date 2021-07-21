module Trinitarianism.AsProps.Quest0 where
open import Trinitarianism.AsProps.Quest0Preamble

{-
  Here are some things that we could like to have in a logical framework
  * Propositions (with the data of proofs)
  * Objects to reason about with propositions

  To make propositions we want
  * False ⊥
  * True ⊤
  * Or ∨
  * And ∧
  * Implication →

  but propositions are useless if they're not talking about anything,
  so we also want
  * Predicates
  * Exists ∃
  * For all ∀
  * Equality ≡ (of objects)
-}

-- Here is how we define 'true'
data ⊤ : Prop where
  trivial : ⊤

{- It reads '⊤ is a proposition and there is a proof of it, called "trivial"'. -}

-- Here is how we define 'false'
data ⊥ : Prop where

{- This says that ⊥ is the proposition where there are no proofs of it. -}

{-
Given two propositions P and Q, we can form a new proposition 'P implies Q'
written P → Q
To introduce a proof of P → Q we assume a proof x of P and give a proof y of Q

Here is an example demonstrating → in action
-}

TrueToTrue : ⊤ → ⊤
TrueToTrue = ?

{-
  * press C-c C-l (this means Ctrl-c Ctrl-l) to load the document,
    and now you can fill the holes
  * navigate to the hole { } using C-c C-f (forward) or C-c C-b (backward)
  * press C-c C-r and agda will try to help you (r for refine)
  * you should see λ x → { }
  * navigate to the new hole
  * C-c C-, to check what agda wants in the hole (C-c C-comma)
  * the Goal area should look like

  Goal: ⊤
  ————————————————————————————————————————————————————————————
  x : ⊤

  * this means you have a proof of ⊤ 'x : ⊤' and you need to give a proof of ⊤
  * you can now give it a proof of ⊤ and press C-c C-SPC to fill the hole

  There is more than one proof (see solutions) - are they the same?
-}

{-
Let's assume we have the following the naturals ℕ
and try to define the 'predicate on ℕ' given by 'x is 0'
-}
isZero : ℕ → Prop
isZero zero = ?
isZero (suc n) = ?

{-
Here's how:
  * when x is zero, we give the proposition ⊤
  (try typing it in by writing \top then pressing C-c C-SPC)
  * when x is suc n (i.e. 'n + 1', suc for successor) we give ⊥ (\bot)
This is technically using induction - see AsTypes.

In general a 'predicate on ℕ' is just a 'function' P : ℕ → Prop
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

In general if we have predicate P : ℕ → Prop we would write
  Σ ℕ P
for
  ∃ x ∈ ℕ, P x

To formulate the result Σ ℕ isZero we need to define
a proof of it
-}
ExistsZero : Σ ℕ isZero
ExistsZero = ?

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
AllZero→⊥ = ?

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
data OR (P Q : Prop) : Prop where
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

data _∨_ (P Q : Prop) : Prop where
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
