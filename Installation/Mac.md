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
