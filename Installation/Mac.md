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

# Installs emacs-mac wth sexy icon and no title bars
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules --with-emacs-sexy-icon --with-no-title-bars

# Make an app link in Applications
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
```
