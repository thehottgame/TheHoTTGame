Installing TheHoTTGame on MacOS
===============================


`https://sourceforge.net/projects/git-osx-installer/`
`brew link --overwrite git`
`rm -r .emacs.d`

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
# Installs emacs-mac
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
# Adds gives the app
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
```
