
# Table of Contents

1.  [Aims of the HoTT Game](#org45da28b)
    1.  [To get mathematicians with no experience in proof verification interested in HoTT and able to use Agda for HoTT](#org6c86aa4)
    2.  [Work towards showing an interesting result in HoTT](#org5c370bf)
    3.  [Try to balance hiding cubical implementations whilst exploiting their advantages](#org2cc236e)
2.  [Barriers](#org483c28e)
    1.  [Installation of emacs](#orgfaee064)
    2.  [Usage of emacs](#org4ec8663)
    3.  [General type theoretic foundations](#orgd6212c3)
    4.  [Cubical type theory](#orgdb053bf)


<a id="org45da28b"></a>

# Aims of the HoTT Game


<a id="org6c86aa4"></a>

## To get mathematicians with no experience in proof verification interested in HoTT and able to use Agda for HoTT


<a id="org5c370bf"></a>

## [?] Work towards showing an interesting result in HoTT


<a id="org2cc236e"></a>

## Try to balance hiding cubical implementations whilst exploiting their advantages


<a id="org483c28e"></a>

# Barriers


<a id="orgfaee064"></a>

## HOLD Installation of emacs


<a id="org4ec8663"></a>

## TODO Usage of emacs


<a id="orgd6212c3"></a>

## TODO General type theoretic foundations


<a id="orgdb053bf"></a>

## TODO Cubical type theory

\## Format

-   [?] Everything done in .agda files
-   Partially written code with spaces for participants to fill in + answer files
-   Levels set out with mini-bosses like in Nat Num Game, but with an overall boss
-   [?] Side quests
-   References to Harper lectures and HoTT book

<!&#x2013; listing topics we have pursued, NO ordering &#x2013;>

-   emacs usage
-   agda usage
    -   basic commands (all covered in <https://agda.readthedocs.io/en/v2.6.0.1/getting-started/quick-guide.html>)
    -   recommend doom emacs
    -   implicit/explicit arguments
    -   holes and inferred types
    -   \`\_+\_\` and \`plus\_\_\`
-   type theory basics
    -   meta (judgemental/definitional) equality vs internal (propositional) equality
        -   function extensionality
    -   type formation
        -   inductive types
            -   (side Q) positive and negative constructions of Pi/Sigma types
            -   \`data\` and \`record\`
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

-   2021 July 15; Homotopy n-types
    -   watched (Harper) lecture 15 on Sets being closed under type formations ->- motivates showing in Agda Sets closed under Sigma.
    -   Harper does product case, claiming sigma case follows analogously,
    -   attempt proof in Cubical Agda but highly non-obvious how to use that fibers are Sets.
    -   difficulty is that PathP not in one fiber, but PathOver is, AND PathOver <-> PathP NON-obvious
    -   Easy to generalize situation to n-types being closed under Sigma (7.1.8 in HoTT book), we showed this assuming PathPIsoPath

