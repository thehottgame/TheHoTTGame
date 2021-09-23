# George feedback

## Subject info

[] has some experience with type theory and haskell

## Quest0/Part0

[x] clarify the notation `a : A`
[x] hide the imports
[x] definition of inductive type doesn't make sense
  without the further details.
[x] confusion of `{!!}` and `{0}` and `?`
[x] comparing holes to agda-info window is intuitive
[x] error on firsts refine
[x] add at each step what the agda-info window looks like
[x] confusion about hole numbers. "just ignore them"
[x] subject tries to read constraint in agda-info window. 
    Shld deal with this somehow.
[] emphasize no need to fill holes in order.
  
## Quest0/Part1

[x] subject confused about 'space of spaces'.
  More specifically, need to say `a : A` means "`a` is a point of the space `A`".
[x] we shld say `a ≡ b` means space of paths from `a` to `b`.
[-] 'contradiction' is a pre-existing concept in subject brain.
[x] "not sure that helps" - subject about definition of `Bool`
[x] "is `flipPath` taking a point from `Bool` to another point of `Bool`
  or is it taking a space to another space?"
[] "just some terminology" - subject on the definition of _fiber_.
  Subject did not take in the picture of what it is called fiber.
[-] need to add earlier how to check goal of holes.
[x] need to be clear _we are assuming `flipPath` is constructed already_.
[x] overall : need to be clearer that `Type` is space of spaces,
  and paths in `Type` are saying which spaces are the same.

## Quest0/Part2

[x] For the `iso` bit, change to just `C-c C-r` cuz `Iso` only has one constructor.
[x] say you can check def of `Iso` by using `SPC c d`
[x] say "just write `s` and `r` and write the rest then load".
[x] emphasize agda is indentation sensitive.
[x] subject unexpectedly extracts lemma `true ≡ true`.
