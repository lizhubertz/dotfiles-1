if [[ ! -x /usr/local/bin/brew ]] ; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew_packages=(
  atom
  autoconf
  autojump
  bash-completion
  dos2unix
  findutils
  git
  git-extras
  gti
  grip
  htop-osx
  markdown
  nodenv
  pkg-config
  python
  rbenv
  rbenv-gemset
  readline
  ruby-build
  ssh-copy-id
  the_silver_searcher
  tig
  tmux
  tree
  trash
  unrar
  vim --with-override-system-vi
  wget
)
brew install ${brew_packages[@]}

# apps
cask_packages=(
  1password
  alfred
  dash
  datagrip
  dropbox
  fantastical
  google-chrome
  google-chrome-canary
  nvalt
  qlcolorcode
  qlimagesize
  qlmarkdown
  quicklook-json
  rescuetime
  rubymine
  slack
  spectacle
  spotify
  webpquicklook
)

brew cask install --force --appdir="/Applications" ${cask_packages[@]}

# Install fonts
brew tap caskroom/fonts

fonts=(
  font-clear-sans
  font-roboto
  font-source-code-pro
  font-inconsolata
  font-hack
)

echo "Installing fonts..."
brew cask install --force ${fonts[@]}

brew cleanup

echo "Initializing rbenv"
rbenv init

echo "Initializing nodenv"
nodenv init
