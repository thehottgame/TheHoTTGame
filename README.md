The HoTT Game
=============

The Homotopy Type Theory (HoTT) Game is a project written by mathematicians 
for mathematicians interested in HoTT and no experience in proof verification,
with the aim of introducing Cubical Agda as a tool for
trying out mathematics in HoTT.
This page will help you get the Game working for you.

## Installing Agda and the Cubical Agda library

Our Game is in Agda, which can be installed following instructions 
[on their site](
https://agda.readthedocs.io/en/latest/getting-started/installation.html).
It is recommended that you use Agda in the text editor 
[emacs](
https://www.gnu.org/software/emacs/tour/index.html),
in particular 
[Doom Emacs](https://github.com/hlissner/doom-emacs),
if you can't be bothered to do a bunch of configuration.

Once you have Emacs and Agda, get the [Cubical Library](
https://github.com/agda/cubical) (version 0.3)
and make sure Agda knows where your cubical library is 
by following instructions on the [library management page](
https://agda.readthedocs.io/en/latest/tools/package-system.html?highlight=library%20management).
In short: locate (or create) your `libraries` file and add a line 
```
the-directory/cubical.agda-lib
```
to it, where `the-directory` is the location of `cubical.agda-lib` on your computer.

Get the HoTT Game by [cloning this repository](
https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)
into a folder and then making sure that Agda knows where the HoTT Game is
by adding a line 
```
the-directory/HoTTGameLib.agda
```
to your `libraries` file as above.

Try opening `Trinitarianism/Quest0.agda` in Emacs
and do `Ctrl-c Ctrl-l`.
Some text should be highlighted, and any `?` should turn into `{ }`.

## Where to start?

You can start with `0Trinitarianism` if you are interested in
how logic, type theory and category theory come together 
as different ways to view the same thing.
If you are more interested in homotopy theory,
try `1FundamentalGroup` where we show that the 
fundamental group of `S¹` is `ℤ`.

## How to start?

To start with `1FundamentalGroup` (for example),
find the GitHub page [`1FundamentalGroup/Quest0Part0.md`](
https://github.com/thehottgame/TheHoTTGame/blob/main/1FundamentalGroup/Quest0Part0.md
)
and follow the instructions there,
then trying the following files in the same directory.
Open up the corresponding `.agda` file in `emacs` to 
follow along with the instructions in the quests.

## Emacs issues

If you can't figure out `emacs` or forget some command, then 
try consulting our guide for [basic Emacs commands](
https://github.com/thehottgame/TheHoTTGame/blob/main/EmacsCommands.md
).
