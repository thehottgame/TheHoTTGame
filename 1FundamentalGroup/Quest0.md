Whoa very cool
=======================

In this series of quests we will prove that the fundamental group
of `S¹` is `ℤ`.
In fact, our strategy will also show that the higher homotopy groups of
`S¹` are all trivial. 
We begin by formalising the problem statement.



## The Circle

A contruction of 'the circle' is :

- a point
- an edge from that point to itself

Here is our definition of the circle in `agda`.

```agda
data S¹ : Type where
  base : S¹
  loop : base ≡ base
```

The `base \== base` is the _space of paths from `base` to `base`_.
An "edge" is the same as a path.

