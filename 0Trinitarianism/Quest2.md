# Sigma Types

We are still trying to express and 'prove' the statement

> There exists a natural that is even.

We will achieve this by the end of this quest.

## Existence / Dependent Pair / Total Space of Bundles

Recall from [Quest 1](
https://github.com/thehottgame/TheHoTTGame/blob/main/0Trinitarianism/Quest1.md
)
that we defined `isEven`.
What's left is to be able write down "existence".
In maths we might write 
```
∃ x ∈ ℕ, isEven x
```
which in agda notation is 
```
Σ ℕ isEven
```
This is called a _sigma type_, which has three interpretations:

- the proposition 'there exists an even natural'
- the construction 
  'keep a recipe `n` of naturals together with a recipe of `isEven n`'
- the total space of the bundle `isEven` over `ℕ`,
  which is the space obtained by putting together all the fibers.
  Pictorially, it looks like
  
  <img src="images/isEvenBundle.png" 
       alt="SigmaTypeOfIsEven" 
       width="500"/>
     
  which can also be viewed as the subset of even naturals,
  since the fibers are either empty or singleton. 
  (It is a _subsingleton bundle_).

## Making terms in Sigma Types
Making a term of this type has three interpretations:

- a natural `n : ℕ` together with a proof `hn : isEven n` that `n` is even.
- a recipe `n : ℕ` together with a recipe `hn : isEven n`.
- a point in the total space is a point `n : ℕ` downstairs
  together with a point `hn : isEven n` in its fiber.

Now you can prove that there exists an even natural:

- Formulate the statement you need. Make sure you have it of the form 
  ```agda
  Name : Statement
  Name = ?
  ```
- Load the file, go to the hole and refine the goal.
- If you formulated the statement right it should split into `{!!} , {!!}`
  and you can check the types of terms the holes require.
- Fill the holes. There are many proofs you can do!

In general when `A : Type` is a type and `B : A → Type` is a 
predicate/dependent construction/bundle over `A`, 
we can write the sigma type `Σ A B` whose terms are pairs `a , b` 
where `a : A` and `b : B a`. 
In the special case when `B` is not dependent on `a : A`,
i.e. it looks like `λ a → C` for some `C : Type` then 
`Σ A B` is just 
- the proposition '`A` and `C`' 
  since giving a proof of this is the same as giving a proof 
  of `A` and a proof of `C`
- a recipe `a : A` together with a recipe `c : C`
- `B` is now a _trivial bundle_ since the fibers `B a` are 
  constant with respect to `a : A`.
  In other words it is just a _product_ `Σ A B ≅ A × C`.
  For this reason, 
  some refer to the sigma type as the _dependent product_,
  but we will avoid this terminology.
```agda
_×_ : Type → Type → Type
A × C = Σ A (λ a → C)
```
Agda supports the notation `_×_` (without spaces)
which means from now on you can write `A × C` (with spaces).

## Using Terms in Sigma Types

There are two ways of using a term in a sigma type.
We can extract the first part using `fst` or the second part using `snd`.
Given `x : Σ A B` there are three interpretations of `fst` and `snd`:
- Viewing `x` as a proof of existence
  `fst x` provides the witness of existence and `snd` provides the proof 
  that the witness `fst x` has the desired property
- Viewing `x` as a recipe `fst` extracts the first component and 
  `snd` extracts the second component 
- Viewing `x` as a point in the total space of a bundle 
  `fst x` is the point that `x` is over in the base space and `snd x`
  is the point in the fiber that `x` represents.
  In particular you can interpret `fst` as projection from the total space
  to the base space, collapsing fibers.
For example to define a map that takes an even natural and divides it by two 
we can do 
```agda
div2 : Σ ℕ isEven → ℕ
div2 x = ? 
```
- Load the file, go to the hole and case on `x`.
  You might want to rename `fst₁` and `snd₁`. 
  ```agda
  div2 : Σ ℕ isEven → ℕ
  div2 (fst₁ , snd₁) = {!!}
  ```
- Case on `fst₁` and tell agda what to give for `0 , _`,
  i.e. what 'zero divided by two' ought to be.
  ```agda
  div2 : Σ ℕ isEven → ℕ
  div2 (zero , snd₁) = {!!}
  div2 (suc fst₁ , snd₁) = {!!}
  ```
- Navigate to the second hole and case on `fst₁` again.
  Notice that agda knows there is no term looking like `1 , _`
  so it has skipped that case for us.
  ```agda
  div2 : Σ ℕ isEven → ℕ
  div2 (zero , snd₁) = 0
  div2 (suc (suc fst₁) , snd₁) = {!!}
  ```
- `(n + 2) / 2` should just be `n/2 + 1` 
  so try writing in `suc` and refining the goal
- How do you write down `n/2`? Hint: we are in the 'inductive step'.

Try dividing some terms by `2`:
- Use `C-c C-n` and write `div2 (2 , tt)` for example.
- Try dividing `36` by `2`.

*Important Observation* : 
the two proofs `2 , tt` and `36 , tt` of the statement 
'there exists an even natural' are not 'the same' in any sense,
since if they were `div2 (2 , tt)` would be 'the same' `div2 (36/2 , tt)`,
and hence `1` would be 'the same' as `18`. 

> Are they 'the same'? What is 'the same'? 

## Side Quest : a Tautology / Currying / Cartesian Closed

In this side quest, 
you will construct the following functions.

```agda
uncurry : (A → B → C) → (A × B → C)
uncurry f x = ?

curry : (A × B → C) → (A → B → C)
curry f a b = ?
```
These have three interpretations : 

- `uncurry` is a proof that
  "if `A` implies '`B` implies `C`',
  then '`A` and `B`' implies `C`".
  A proof of the converse is `curry`.
- [currying](
https://en.wikipedia.org/wiki/Currying#:~:text=In%20mathematics%20and%20computer%20science,each%20takes%20a%20single%20argument.)
- this is a commonly occuring example of an _adjunction_.
  See
  [here](https://kl-i.github.io/posts/2021-07-12/#product-and-maps)
  for a more detailed explanation.

Note that we have _postulated_ the types `A, B, C` for you.
```agda
private
  postulate
    A B C : Type
```
In general, you can use this to
introduce new constants to your agda file.
The `private` ensures `A, B, C` can only be used
within this agda file.

> Tip : Agda is space-and-indentation sensitive,
> i.e. the `private` applies to anything beneath it
> that is indented two spaces.
