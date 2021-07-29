# Terms and Types

There are three ways of looking at `A : Type`.
  - proof theoretically, '`A` is a proposition'
  - type theoretically, '`A` is a construction'
  - categorically, '`A` is an object in category `Type`'

A first example of a type construction is the function type.
Given types `A : Type` and `B : Type`, 
we have another type `A → B : Type` which can be seen as
  - the proposition '`A` implies `B`'
  - the construction 'ways to convert `A` recipes to `B` recipes'
  - internal hom of the category `Type`

To give examples of this, let's make some types first!

```agda 
-- Here is how we define 'true'
data ⊤ : Type u where
  tt : ⊤
```

It reads '`⊤` is an inductive type with a constructor `tt`',
with three interpretations
  - `⊤` is a proposition and there is a proof of it, called `tt`.
  - `⊤` is a construction with a recipe called `tt`
  - `⊤` is a terminal object: every object has a morphism into `⊤` given by `· ↦ tt`

In general, the expression `a : A` is read '`a` is a term of type `A`',
and has three interpretations,
  - `a` is a proof of the proposition `A`
  - `a` is a recipe for the construction `A`
  - `a` is a generalised element of the object `A` in the category `Type`.

The above tells you how we _make_ a term of type `⊤`.
Let's see an example of _using_ a term of type `⊤`:

```agda
TrueToTrue : ⊤ → ⊤
TrueToTrue = {!!}
```

  - press `C-c C-l` (this means `Ctrl-c Ctrl-l`) to load the document,
    and now you can fill the holes
  - navigate to the hole `{ }` using `C-c C-f` (forward) or `C-c C-b` (backward)
  - press `C-c C-r` and agda will try to help you (r for refine)
  - you should see `λ x → { }`
  - navigate to the new hole
  - `C-c C-,` to check the goal (`C-c C-comma`)
  - the Goal area should look like

  ```agda
  Goal: ⊤
  —————————————————————————
  x : ⊤
  ```

  - you have a proof/recipe/generalized element `x : ⊤`
  and you need to give a p/r/g.e. of `⊤`
  - you can give it a p/r/g.e. of `⊤` and press `C-c C-SPC` to fill the hole

There is more than one proof (see solutions) - are they 'the same'?
What is 'the same'?

Here is an important solution:

```agda
TrueToTrue' : ⊤ → ⊤
TrueToTrue' x = {!!}
```

  - Naviagate to the hole and check the goal.
  - Note `x` is already taken out for you.
  - You can try type `x` in the hole and `C-c C-c`
  - `c` stands for 'cases on `x`' and the only case is `tt`.

Built into the definition of `⊤` is agda's way of making a map out of ⊤
into another type A, which we have just used.
It says 'to map out of ⊤ it suffices to do the case when `x` is `tt`', or
  - the only proof of `⊤` is `tt`
  - the only recipe for `⊤` is `tt`
  - the only one generalized element `tt` in `⊤`

Let's define another type.

```agda

data ⊥ : Type u where

```

It reads '`⊥` is an inductive type with no constructors',
with three interepretations
  - `⊥` is a proposition with no proofs
  - `⊥` is a construction with no recipes
  - There are no generalized elements of `⊥` (it is a strict initial object)

Let's try mapping out of `⊥`.

```agda
explosion : ⊥ → ⊤
explosion x = {!!}
```

  - Navigate to the hole and do cases on `x`.

Agda knows that there are no cases so there is nothing to do!
This has three interpretations:
  - false implies anything (principle of explosion)
  - ?
  - `⊥` is initial in the category `Type`

We can also encode "natural numbers" as a type.

```agda
data ℕ : Type where
  zero : ℕ
  suc : ℕ → ℕ
```

As a construction, this reads '
  - `ℕ` is a type of construction
  - `zero` is a recipe for `ℕ`
  - `suc` takes an existing recipe for `ℕ` and gives
      another recipe for `ℕ`.
  '

We can see `ℕ` categorically :
ℕ is a natural numbers object in the category `Type`.
This means it is equipped with morphisms `zero : ⊤ → ℕ` 
and `suc : ℕ → ℕ` such that
given any `⊤ → A → A` there exist a unique morphism `ℕ → A`
such that the diagram commutes:
<img src="images/nno.png" 
     alt="nno" 
     width="500"
     class="center"/>

This has no interpretation as a proposition since
there are 'too many proofs' -
mathematicians classically don't distinguish
between proofs of a single proposition.
(ZFC doesn't even mention logic internally,
unlike Type Theory!)

To see how to use terms of type `ℕ`, i.e. induction on `ℕ`, 
go to Quest1!

## Universes

You may have noticed the notational similarities between 
`zero : ℕ` and `ℕ : Type`.
This may have lead you to the question, `Type : ?`.
In type theory, we simply assert `Type : Type 1`.
But then we are chasing our tail, asking `Type 1 : ?`.
Type theorists make sure that every type (the thing on the right side of the `:`)
itself is a term, and every term has a type.
So what we really need is 
```
Type : Type₁, Type₁ : Type₂, Type₂ : Type₃, ⋯
```
These are called _universes_.
The numberings of universes are called _levels_.

<!--
Everything we will make will be closed in 
the universe we are in.
For example,

- Do `C-c C-d`. 
  Agda will ask you to input an expression.
- Input `⊤ → ℕ` and hit return.

In the 'agda information' window, you should see `Type`.
This means Agda has _deduced_ `⊤ → ℕ : Type`.
In general, you can use `C-c C-d` to check
the type of terms. 

The reason that `⊤ → ℕ` is a type in `Type`
is because both `⊤, ℕ` are.
-->
