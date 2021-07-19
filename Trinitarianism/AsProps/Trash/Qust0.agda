{- This says that ⊥ is the proposition where there are no proofs of it. -}

{-
Given two propositions P and Q, we can form a new proposition 'P implies Q'
written P → Q
To introduce a proof of P → Q we assume a proof x of P and give a proof y of Q

Here is an example demonstrating → in action
-}
-- TrueToTrue : ⊤ → ⊤
-- TrueToTrue = ?

{-
  * press C-c C-l (this means Ctrl-c Ctrl-l) to load the document,
    and now you can fill the holes
  * press C-c C-r and agda will try to help you,
  * you should see λ x → { }
  * navigate to the hole { } using C-c C-f (forward) or C-c C-b (backward)
  * to check what agda wants in the hole use C-c C-,
  * the Goal area should look like
  Goal: ⊤
  ————————————————————————————————————————————————————————————
  x : ⊤

  * this means you have a proof x : ⊤ and you need to give a proof of ⊤
  * you can now give it a proof of ⊤ and press C-c C-SPC to fill the hole

  There is more than one proof (see answers) - are they the same?
-}

-- solutions:
