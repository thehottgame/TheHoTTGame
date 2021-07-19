The HoTT Game
=============

The Homotopy Type Theory (HoTT) Game is a project aimed at 
introducing mathematicians with no experience 
in proof verification interested in HoTT and able to use Agda for HoTT.
This guide will help you get the Game working for you.

## Installing Agda and the Cubical Agda library

Our Game is in Agda, which can be installed following instructions 
[on their site](
https://agda.readthedocs.io/en/latest/getting-started/installation.html).
It is recommended that you use Agda in the text editor 
[emacs](
https://www.gnu.org/software/emacs/tour/index.html),
in particular 
[Doom Emacs](https://github.com/hlissner/doom-emacs) is a bit nicer if you
can't be bothered to do a bunch of configuration.

Once you have Emacs and Agda, get the [Cubical Library](
https://github.com/agda/cubical) (version 0.3)
and make sure Agda knows where your cubical library is 
by following instructions on the [library management page](
https://agda.readthedocs.io/en/latest/tools/package-system.html?highlight=library%20management).
(In short: locate (or create) your `libraries` file and add a line 
```
the-directory/cubical.agda-lib
```
to it, where `the-directory` is the location of `cubical.agda-lib` on your computer.)

Get the HoTT Game by [cloning this repository](
https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)
into a folder and then making sure that Agda knows where the HoTT Game is
by adding a line 
```
the-directory/HoTTGameLib.agda
```
to your `libraries` file as above.

Try opening up `Trinitarianism/AsProps/Quest0.agda` in Emacs
and do `Ctrl-c Ctrl-l`. 
Some text should be highlighted, and any `?` should turn into `{ }`.

## How the game works

Our Game is currently under development. Please contact the devs.
Currently you can try `Trinitarianism/AsProps/Quest0.agda`,
making use of the accompanying solutions Agda file.

## Emacs and Agda usage
We have a file with a list of basic Emacs commands and 
you _should_ be able to learn how to use Agda as you go along.

## Feedback
If you have any feedback please contact the devs. 
