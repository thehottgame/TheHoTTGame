# George feedback

## Subject info

- has some experience with type theory and haskell

## Quest0/Part0

- clarify the notation `a : A`
- hide the imports
- definition of inductive type doesn't make sense
  without the further details.
- confusion of `{!!}` and `{0}` and `?`
- comparing holes to agda-info window is intuitive
- error on firsts refine
- add at each step what the agda-info window looks like
- confusion about hole numbers. "just ignore them"
- subject tries to read constraint in agda-info window. 
  Shld deal with this somehow.
- emphasize no need to fill holes in order.
  
## Quest0/Part1

- subject confused about 'space of spaces'.
  More specifically, need to say `a : A` means "`a` is a point of the space `A`".
- we shld say `a ≡ b` means space of paths from `a` to `b`.
- 'contradiction' is a pre-existing concept in subject brain.
- "not sure that helps" - subject about definition of `Bool`
- "is `flipPath` taking a point from `Bool` to another point of `Bool`
  or is it taking a space to another space?"
- "just some terminology" - subject on the definition of _fiber_.
  Subject did not take in the picture of what it is called fiber.
- need to add earlier how to check goal of holes.
- need to be clear _we are assuming `flipPath` is constructed already_.
- overall : need to be clearer that `Type` is space of spaces,
  and paths in `Type` are saying which spaces are the same.

## Quesst0/Part2

- For the `iso` bit, change to just `C-c C-r` cuz `Iso` only has one constructor.
- say you can check def of `Iso` by using `SPC c d`
- say "just write `s` and `r` and write the rest then load".
- emphasize agda is indentation sensitive.
- subject unexpectedly extracts lemma `true ≡ true`.
