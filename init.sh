#!/bin/sh

ARCH=$(arch)


# install brew deps
brew install git tig
brew install direnv
brew install macvim mc
brew install go
brew install tmux
brew install ag fd bat watch p7zip tldr htop
brew install httpie
brew install jq yq
brew install fzf
brew install nvm 
brew install speedtest-cli wifi-password
brew install python pyenv
brew install redis
brew install exa

# optionally also can be installed: zoom
# casks
brew install jetbrains-toolbox
brew install visual-studio-code
brew install keepassxc
brew install slack
brew install sublime-text
brew install robo-3t
brew install tunnelbear
brew install transmission
brew install rectangle
brew install zoom
brew install flycut
brew install drovio

# https://github.com/mongodb/homebrew-brew
brew install mongodb/brew/mongodb-community

# https://github.com/cloudfoundry/homebrew-tap
if [[ $ARCH != 'arm64' ]]
then
  brew install cloudfoundry/tap/bosh-cli
  brew install cloudfoundry/tap/credhub-cli
fi  

# install fonts
brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-monofur-nerd-font
brew install font-jetbrains-mono

# custom scripts
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin/

# vim config
cp .vimrc $HOME/

# VS Code config file
cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"

# mongo cli
cp .mongorc.js $HOME/

#
cp .zshrc $HOME/
