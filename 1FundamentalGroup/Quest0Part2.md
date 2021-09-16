# `Refl ≡ loop` is empty - Defining `flipPath` via Univalence

In this part, we will define the path `flipPath : Bool ≡ Bool`.
Recall the picture of `doubleCover`.
(Insert gif.)

This means we need `flipPath` to correspond to 
the unique non-identity permutation of `Bool`
that flips `true` and `false`.

We proceed in steps :

1. Define the function `Flip : Bool → Bool`.
2. Promote this to an isomorphism `flipIso : Bool ≅ Bool`.
3. We use _univalence_ to turn `flipIso` into 
   a path `flipPath : Bool ≡ Bool`.
   The univalence axiom asserts that
   paths in `Type` - the space of spaces - correspond to
   homotopy-equivalences of spaces.
   As a corollary,
   we can make paths in `Type` from isomorphisms in `Type`.

## The function

- In `1FundamentalGroup/Quest0.agda`, navigate to :

  ```agda
  Flip : Bool → Bool
  Flip x = {!!}
  ```
- Write `x` inside the hole,
  and do `C-c C-c` with your cursor still inside. 
  You should now see :
  ```agda
  Flip : Bool → Bool
  Flip false = {!!}
  Flip true = {!!} 
  ```
  This means : 
  the space `Bool` is made of two points `false, true` and nothing else,
  so to map out of `Bool` it suffices 
  to find images for `false` and `true` respectively.
- Since we want `Flip` to flip `true` and `false`,
  fill the first hole with `true` and the second with `false`.
- To check things have worked,
  try `C-c C-d`. (`d` stands for _deduce_.)
  Then `agda` will ask you to input an expression.
  Enter `Flip`.
  In the `*Agda Information*` window,
  you should see 

  ```agda
  Bool → Bool  
  ```
  
  This means `agda` recognises `Flip` as a well-formulated term
  and is a point in the space of maps from `Bool` to `Bool`.
- We can also ask `agda` to compute outputs of `Flip`.
  Try `C-c C-n` (`n` stands for _normalise_),
  `agda` should again be asking for an expression.
  Enter `Flip true`.
  In the `*Agda Information*` window, you should see `false`, as desired.

## The isomorphism

- Navigate to
  ```agda
  flipIso : Bool ≅ Bool
  flipIso = {!!} 
  ```
- Write `iso` in the hole and refine with `C-c C-r`.
  You should now see 
  ```agda
  flipIso : Bool ≅ Bool
  flipIso = iso {!!} {!!} {!!} {!!}  
  ```
- Check that `agda` expects functions `Bool → Bool` 
  to go in the first two holes.
  These are the maps back and forth which constitute the isomorphism,
  so fill them with `Flip` and its inverse `Flip`.
- Check the goal of the next two holes.
  They should be 
  ```agda
  section Flip Flip 
  ```
  and 
  ```agda
  retract Flip Flip 
  ```
  This means we need to prove
  `Flip` is a right inverse and a left inverse of `Flip`.

- Write the following so that your code looks like 
  ```agda
  flipIso : Bool ≅ Bool 
  flipIso = iso Flip Flip s r where

    s : section Flip Flip
    s b = {!!}
    
    r : retract Flip Flip
    r b = {!!} 
  ```
  The `where` allows you to make definitions local to the current definition,
  in the sense that you will not be able to access `s` and `r` outside this proof.
  Note that what follows `where` must be indented.
  <p>
  <details>
  <summary>Skipped step</summary>

  - To find out why we put `s b` on the left you can try 
    ```agda
    flipIso : Bool ≅ Bool 
    flipIso = iso Flip Flip s r where

      s : section Flip Flip
      s = {!!}
    
      r : retract Flip Flip
      r = {!!} 
    ```
  - Check the goal of the hole `s = {!!}` and try using `C-c C-r`.
    It should give you `λ x → {!!}`.
    This says it's asking for some new proof for each `x : Bool`.
    If you check the goal you can find out what proof it wants
    and that `x : Bool`.
  - To do a proof for each `x : Bool`, we can also just stick 
    `x` before the `=` and do away with the `λ`.
  </details>
  </p>
- Check the goal of the hole `s b = {!!}`.
  In the `*Agda Information*` window, you should see 
  ```agda
  Goal: Flip (Flip b) ≡ b
  —————————————————————————————————
  b : Bool 
  ```
  Try to prove this.
  <p>
  <details>
  <summary>Tips</summary>

  You need to case on what `b` can be.
  Then for the case of `true` and `false`,
  try `C-c C-r` to see if `agda` can help.
  
  The added benefit of having `b` before the `=`
  is exactly this - that we can case on what `b` can be.
  This is called _pattern matching_.
  </details>
  </p>
- Do the same for `r b = {!!}`.
- Use `C-c C-d` to check that `agda` is okay with `flipIso`.

## The path

- Navigate to 
  ```agda
  flipPath : Bool ≡ Bool
  flipPath = {!!} 
  ```
- In the hole, write in `isoToPath` and refine with `C-c C-r`.
  You should now have 
  ```agda
  flipPath : Bool ≡ Bool
  flipPath = isoToPath {!!} 
  ```
  If you check the new hole, you should see that
  `agda` is expecting an isomorphism `Bool ≅ Bool`.
  
  `isoToPath` is the function from the cubical library
  that converts isomorphisms between spaces
  into paths between the corresponding points in the space of spaces `Type`.
- Fill in the hole with `flipIso`
  and use `C-c C-d` to check `agda` is happy with `flipPath`.
- Try `C-c C-n` with `transport flipPath false`.
  You should get `true` in the `*Agda Information*` window.
  
  What `transport` did is it took the path `flipPath` in the 
  space of spaces `Type` and followed the point `false`
  as `Bool` is transformed along `flipPath`.
  The end result is of course `true`,
  since `flipPath` is the path obtained from `flip`!
