
# Table of Contents

-   [Planning The HoTT Game](#org3bb90ed)
    -   [Aims of the HoTT Game](#orga8d795d)
    -   [Barriers](#org122a1d0)
    -   [Format](#org3ea389f)
    -   [Content](#org70d2231)
    -   [Debriefs](#org37fbeb9)



<a id="org3bb90ed"></a>

# Planning The HoTT Game


<a id="orga8d795d"></a>

## Aims of the HoTT Game

-   To get mathematicians with no experience in proof verification interested in HoTT and able to use Agda for HoTT
-   [?] Work towards showing an interesting result in HoTT
-   Try to balance hiding cubical implementations whilst exploiting their advantages


<a id="org122a1d0"></a>

## Barriers

-   HOLD Installation of emacs
-   TODO Usage of emacs
-   TODO General type theoretic foundations
-   TODO Cubical type theory


<a id="org3ea389f"></a>

## Format

-   [?] Everything done in .agda files
-   Partially written code with spaces for participants to fill in + answer files
-   Levels set out with mini-bosses like in Nat Num Game, but with an overall boss
-   [?] Side quests
-   References to Harper lectures and HoTT book


<a id="org70d2231"></a>

## Content

-   emacs usage
-   agda usage
    -   basic commands (all covered in <https://agda.readthedocs.io/en/v2.6.0.1/getting-started/quick-guide.html>)
    -   recommend doom emacs
    -   implicit/explicit arguments
    -   holes and inferred types
    -   `_+_` vs `plus__`
-   type theory basics
    -   meta (judgemental/definitional) equality vs internal (propositional) equality
        -   function extensionality
    -   type formation
        -   inductive types
            -   (side Q) positive and negative constructions of Pi/Sigma types
            -   `data` and `record`
    -   universes
    -   recursors / pattern matching
    -   (side Q) some natural number exercises as early evidence of being able to &rsquo;do maths&rsquo;?
    -   different notions of equivalence
        1.  fibers contractable
        2.  quasi-inverse
        3.  zig-zag
    -   (side Q) types are infinity groupoids
    -   extra paths (univalence, fun ext, HITs)
-   HoTT
    -   basics
        1.  meta interval, identity type vs path type
            -   mention identity type for compatability with other sources, but just use path type
        2.  path type on other types
        3.  dependent path type PathP vs path over
        4.  univalence
        5.  the (non)-issue of J in (Cu)TT
        6.  isContr, isProp, isSet
        7.  drawing pictures
    -   Structures, using univalence to transport
        1.  transporting results between isomorphic structures
    -   HITs, examples
        1.  the constructed interval
        2.  booleans and covers
        3.  S<sup>n</sup>
        4.  S<sup>1</sup> with 2 cw structures equiv
    -   Homotopy n-types
        1.  homotopy levels being closed under type constructions, in particular Set and ETT inside HoTT
            -   in particular sigma types


<a id="org37fbeb9"></a>

## Debriefs

-   2021 July 15; Homotopy n-types
    -   watched (Harper) lecture 15 on Sets being closed under type formations ->- motivates showing in Agda Sets closed under Sigma.
    -   Harper does product case, claiming sigma case follows analogously,
    -   attempt proof in Cubical Agda but highly non-obvious how to use that fibers are Sets.
    -   difficulty is that PathP not in one fiber, but PathOver is, AND PathOver <-> PathP NON-obvious
    -   Easy to generalize situation to n-types being closed under Sigma (7.1.8 in HoTT book), we showed this assuming PathPIsoPath

