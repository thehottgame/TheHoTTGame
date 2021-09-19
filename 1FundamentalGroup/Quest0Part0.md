The Circle
=======================

In this series of quests we will prove that the fundamental group
of `S¹` is `ℤ`.
In fact, our strategy will also show that the higher homotopy groups of
`S¹` are all trivial. 
We begin by formalising the problem statement.

A contruction of 'the circle' is :

- a point called `base`
- an edge from that point to itself called `loop`

Here is our definition of the circle in `agda`.

```agda
data S¹ : Type where
  base : S¹
  loop : base ≡ base
```

The `base ≡ base` is the _space of paths from `base` to `base`_.
The definition asserts that there is a point called `loop`
in `base ≡ base`, i.e. a path from `base` to itself.
Whenever we have a colon like `S¹ : Type` or `base : S¹`
it says the former is a point in the latter, 
where the latter is viewed as a space;
in the first case `Type` is the space of spaces.

<p>
<details>
<summary>Further details</summary>

This is called a _higher inductive type_ (HIT), which generally
follows the format of

- `data` 
- the name of the HIT - in our case `S¹`
- the _type_ of the HIT, in our case `Type`
- `where` followed by
- the _constructors_ of the HIT, in our case `base` and `loop`,
  which we will think of as vertices, edges, surfaces, and so on
  
</details>
</p>

An "edge" is the same as a path.
There are other paths in `S¹`, 
for example the _constant path at `base`_.
In `1FundamentalGroup/Quest0.agda` naviage to 

```agda
Refl : base ≡ base
Refl = {!!}
```

we will guide you through defining it.
We are about to construct a path `Refl : base ≡ base` 
(read path `Refl` from `base` to `base`)
The _hole_ `{ }0` is where you describe the path.
We will fill the hole `{ }0`.

- enter `C-c C-l` (this means `Ctrl-c Ctrl-l`).
  Whenever you do this, `agda` will check the document is written correctly.
  This will open the `*Agda Information*` window looking like 
  
  ```
  ?0 : base ≡ base
  ?1 : (something)
  ?2 : (something)
  ...
  ```
  
  This says you have some unfilled _holes_.
- navigate to the hole `{ }0` using `C-c C-f` (forward) or `C-c C-b` (backward)
- enter `C-c C-r`. The `r` stands for _refine_.
  Whenever you do this whilst having your cursor in a hole,
  Agda will try to help you. 
- you should now see `λ i → { }1`. 
  This is `agda` suggesting that for each 
  `i : I` (if you like you can think of this as a generic point
  on the the unit interval `I`) 
  you give a point in between the start and end of the path. 
  This is all you need to specify a path in `agda`.
- navigate to that new hole
- enter `C-c C-,` (this means `Ctrl-c Ctrl-comma`).
  Whenever you make this command whilst having your cursor in a hole, 
  `agda` will check the _goal_, i.e. what kind of thing you need to stick in. 
- the goal (`*Agda information*` window) should look like

```
 Goal: S¹
 —————————————————————————
 i : I
 ———— Constraints ——————————————
...
```
  you see that `agda` knows you have a generic point 
  `i : I` on the unit interval. 
  All the constraints are saying that when you look 
  at `i = 0` and `i = 1`, whatever you give in between must 
  match up with the end points of the path, 
  namely `base` and `base`
- write `base` in the hole, since this is the constant path
- press `C-c C-SPC` to fill the hole with `base`.
  In general when you have some text (and your cursor) in a hole,
  doing `C-c C-SPC` will tell `agda` to replace the hole with that text.
  `agda` will give you an error if it can't make sense of your text.
- the number of holes in the `*Agda Information*` 
  window should have gone down by one,
  this means `agda` has accepted what you filled this hole with.
  Just to be sure you can also reload the `agda` file and check
  that `agda` has no complaints.
- if you want to play around with this you can start again 
  by replacing what you wrote with `?` and doing
  `C-c C-l` 
  
