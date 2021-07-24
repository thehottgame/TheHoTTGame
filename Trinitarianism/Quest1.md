# Dependent Types

In a 'place to do maths'
we would like to be able to express and 'prove'
the statement

> There exists a natural that is even.

This requires the notion of a _predicate_.
In general a predicate on a type `A : Type` is 
a term of type `A → Type`. 
For example,

```agda
isEven : ℕ → Type
isEven n = ? 
```

- Do `C-c C-l` to load the file.
- Navigate to the hole.
- Input `n` in the hole and do `C-c C-c`.
  You should now see 
  
  ```agda
  
  isEven : ℕ → Type
  isEven zero = {!!}
  isEven (suc n) = {!!}

  ```
  Explanation : 'to define a function on `ℕ`,
  it suffices to define the function on the __cases_, 
  `zero` and `suc n`, 
  since these are the only constructors given 
  in the definition of `ℕ`'.
  This has the following interpretations,
  - propositionally, this is the _principle of mathematical induction_.
  - categorically, this is the universal property of a
    natural numbers object.
- Navigate to the first hole and check the goal.
  You should see 
  ```
  Goal: Type
  ———————————
  ```
  Fill the hole with `⊤`, since we want `zero` to be even.
- Navigate to the second hole.
- Input `n` and do `C-c C-c` again.
  You should now see
  ```agda
  isEven : ℕ → Type
  isEven zero = ⊤
  isEven (suc zero) = {!!}
  isEven (suc (suc n)) = {!!} 
  ```
  Explanation : 
  we have just used induction again. 
- Navigate to the first hole and check the goal.
  Agda should be asking for a term of type `Type`,
  so fill the hole with `⊥`,
  since we don't want `suc zero` to be even.
- Navigate to the next hole and check the goal.
  You should see in the 'agda information' window,
  ```
  Goal: Type
  ——————————————
  n : ℕ
  ```
  Explanation :
  We are in the 'inductive step',
  so we have access to the previous natural number.
- Fill the hole with `isEven n`,
  since we want `suc (suc n)` to be even _precisely when_
  `n` is even.
  
  The reason we have access to the term `isEven n` is again
  because we are in the 'inductive step'.
- There should now be nothing in the 'agda info' window.
  Everything is working!

There are three interpretations of `isEven : ℕ → Type`.

- Already mentioned, `isEven` is a predicate on `ℕ`.
- `isEven` is a _dependent construction_.
  Specifically, it is either `⊤` or `⊥` depending on `n : ℕ`.
- `isEven` is a _bundle over `ℕ`_,
  i.e. an object in the over-category `Type↓ℕ`.
  Pictorially, it looks like (insert picture).
