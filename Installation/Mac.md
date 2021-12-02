Installing TheHoTTGame on MacOS
===============================


`https://sourceforge.net/projects/git-osx-installer/`
`brew link --overwrite git`
`rm -r .emacs.d`

`export PATH="/usr/local/bin:$PATH"`
in `.bash_profile` (if old)

```
# required dependencies
brew install git ripgrep

# makes computer use latest git
export PATH=/usr/local/bin:$PATH

# optional dependencies
brew install coreutils fd

# Installs clang
xcode-select --install

# For fonts
brew install fontconfig

# Installs emacs-mac wth sexy icon and no title bars
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules --with-emacs-sexy-icon --with-no-title-bars

# Make an app link in Applications
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app

# doom emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# so that you can use 'doom' anywhere
export PATH=”$HOME/.emacs.d/bin:$PATH”

```

Installing TheHoTTGame on MacOS with Nix
========================================

`Nixpkgs` maintains a set of `Agda` libraries that can be added to a derivation managed by the nix package manager. See [here](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/agda.section.md) for details.  `shell.nix` in this project contains a derivation that will add emacs, agda, the agda standard library, and cubical agda to your local nix store and subsequently to a local shell environment by adding these locations to your PATH.

However, because user configurations for emacs are mutable, it will not (easily) manage your (emacs configuration) dot-files, so we will use the underlying `emacs` provided by `nixpkgs` but install `doom emacs` normally in your local user's environment.


Install nix using `curl`: https://nixos.org/download.html

In the base directory,
```bash
nix-shell
```

To enter a nix shell with the above packages loaded on your `PATH`.  This shell is defined by package set in `shell.nix`; after installation, to use agda libraries, you will need to use _this_ shell (or another configured similarly) to load the requisite packages onto the `PATH` so that they can be found.

[Then install `doom emacs`](https://github.com/hlissner/doom-emacs) using the `nix-shell` provided `emacs`:

```bash
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

You'll probably want to answer "yes" to the options unless you know better.

[Add the doom utility to your path](https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#the-bindoom-utility):

> I recommend you add ~/.emacs.d/bin to your PATH so you can call doom directly and from anywhere. Accomplish this by adding this to your .bashrc or .zshrc file: ~export PATH=”$HOME/.emacs.d/bin:$PATH”~

Add `agda` support to `doom` by editing your `~/.doom.d/config.el`.  In the languages section `:lang`, you'll see `;; agda`.  Replace it with `(agda +local)` to tell doom to use the `agda-mode` version specified by the local environment.

Once the file is saved, sync `doom` from within the nix-shell that was loaded above:

```bash
doom sync
```

You can now load the agda source code in this by starting doom from the nix-shell:
```bash
doom run .
```

open the file at `0Trinitarianism/Quest0.agda`

and tell `agda-mode` to load and check it by pressing `SPC m l` (`space`, `m` and `l`, in that order.)  If everything is configured correctly, you should get nice colors and any `{!!}`s will become interactive holes to fill.





