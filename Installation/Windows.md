How to Install the HoTT Game on Windows
=======================================

## Prerequisites
   
MUST USE POWERSHELL AS ADMIN
- chocolatey (this shld be easy)
- Via chocolatey
  - `choco install ghc`
  - `choco install cabal`
- via cabal
  - `cabal install happy`
  - `cabal install alex`

## The Damned Paths

Something something need to add new system environment variables,
need to ask Samuel again.

## Doom Emacs

IN POWERSHELL LOCAL TO USER

- Prerequisites
  ```
  choco install git emacs ripgrep
  choco install fd llvm
  ``` 
- Doom Emacs itself
  ```
  git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
  ~/.emacs.d/bin/doom install
  ```
  **Icons will be missing for windows sadly**
  
## Development Version of Agda 

POWERSHALL IN LOCAL
- Directly clone the repo for development version.
  _You can choose where to put this_.
  ```
  git clone https://github.com/agda/agda.git
  ```
- We need to install `make` for windows. Easiest via cabal.
  ```
  cabal install make
  ```
- Go into folder of agda repo then do
  ```
  cabal update
  make install
  ```
- Agda should be finished. Use `agda` in powershell to check version.

Now agda-mode in Doom Emacs.
- to install agda2-mode.
  ```
  M-x package-install
  ```
- In `init.el`, uncomment `agda` in `lang`.
- `doom sync` to update. Then `SPC-q-R` to restart.

To test things, make a `test.agda` file anywhere you'd like.
- Using Doom Emacs, open `test.agda`. 
- Type in
  ```agda
  open import Agda.Builtin.Nat
  ```
- Use `C-c C-d` then enter `Nat`.
  The output in the agda info window should be `Set`.
  
Congratulations, you now have Agda and
can use emacs bindings for Agda.
However, you have nothing more than the
builtin types.

## The Cubical Library

The HoTT Game currently requires the `cubical-0.3` library.
We walk through _a_ installation of the `cubical-0.3` library.
See the [Agda documentation](https://agda.readthedocs.io/en/latest/tools/package-system.html) 
for more about libraries.

- Go to [here](https://github.com/agda/cubical/releases).
  Under 'version 0.3', 
  download the 'Source Code' file in either formats `zip` or `tar.gz`. 
- Open the 'Source Code' file.
  It should turn into a folder which contains a folder called 
  'cubical'.
- Rename 'cubical' to 'cubical-0.3'. 
  Inside it, there should be a `cubical.agda-lib` file
  with contents 
  ```
  name: cubical-0.3
  include: .
  depend:
  flags: --cubical --no-import-sorts
  ```
  This is the file that tells Agda "this is a library" when
  Agda looks into this folder.
  You can place 'cubical' anywhere you like.
  For the sake of this guide,
  let's say you put it in a place so that
  the path is `LOCATION/cubical-0.3`.

Now we need to tell Agda this 'cubical-0.3' library exists,
so that it will look for it when an Agda file uses code from it.

- Open Powershell locally and do 
  ```
  agda -l fjdsk Dummy.agda
  ```
- Assuming you don't already have an Agda library called `fjdsk`,
  you should see an error message of the form 
  ```
   Library 'fjdsk' not found.
   Add the path to its .agda-lib file to
     'BLAHBLAHBLAH/libraries'
   to install.
   Installed libraries:
     none
  ```
  The `BLAHBLAHBLAH/libraries` is where we tell Agda of
  the location of libraries.
  For Windows, it should look like
  ```
  C:\Users\USERNAME\AppData\Roaming\agda\libraries
  ```
  where `USERNAME` is your username on your computer.
- Navigate to the folder 
  `C:\Users\USERNAME\AppData\Roaming\agda`.
  _If there is no `agda` folder in 
  `C:\Users\USERNAME\AppData\Roaming`,
  simply create one_.
- In `C:\Users\USERNAME\AppData\Roaming\agda`,
  create a file `libraries` if there isn't one already.
  Inside it, put 
  ```
  LOCATION/cubical-0.3/cubical.agda-lib 
  ```
- Now do `agda -l fjdsk Dummy.agda` in powershell locally again.
  This time the error message should be 
  ```
  Library 'fjdsk' not found.
  Add the path to its .agda-lib file to
    'BLAHBLAHBLAH/libraries'
  to install.
  Installed libraries:
    cubical-0.3
      (LOCATION/cubical-0.3/cubical.agda-lib)
  ```
  Congratulations, Agda is now aware of 
  the existence of the `cubical-0.3` library.
  
## The HoTT Game

The HoTT Game is also an Agda library
so we need to repeat the above process for it.

- In Powershell, navigate to 
  where you would like to put the HoTT Game.
- Use `git clone https://github.com/Jlh18/TheHoTTGame.git`.
  This should copy the HoTT Game repository as
  a folder called `TheHoTTGame`.
  For the purposes of this guide,
  let's say you have put the HoTT Game in your computer
  at the path
  ```
  LOCATION1/TheHoTTGame
  ```
  Inside it, you should see many files,
  one of which should be `TheHoTTGame.agda-lib`.
- Go back to `BLAHBLAHBLAH/libraries`
  and add the following line
  ```
  LOCATION1/TheHoTTGame/TheHoTTGame.agda-lib
  ```
- In Powershell, use `agda -l fjdsk Dummy.agda` again.
  The error message should now look something like 
  ```
   Library 'fjdsk' not found.
   Add the path to its .agda-lib file to
     'BLAHBLAHBLAH/libraries'
   to install.
   Installed libraries:
     cubical-0.3
       (LOCATION/cubical-0.3/cubical-0.3.agda-lib)
     TheHoTTGame
       (LOCATION1/TheHoTTGame/TheHoTTGame.agda-lib)
  ```
- Using Doom Emacs, 
  open `Trinitarianism/Quest0.agda` and do `C-c C-l`.
  Congratulations, you can now play the HoTT Game.
