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
brew install ht-rust
brew install jq yq
brew install fzf
brew install nvm 
brew install speedtest-cli wifi-password
brew install python pyenv
brew install redis
brew install exa
brew install lazygit
brew install google-cloud-sdk
brew install kubectl
brew install neofetch

# casks
brew install jetbrains-toolbox
brew install visual-studio-code
brew install sublime-text
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
brew install google-chrome
brew install firefox
brew install 1password
brew install 1password-cli
brew install raycast
brew install obsidian
brew install hiddenbar

# https://github.com/mongodb/homebrew-brew
brew install mongodb/brew/mongodb-community

# apg
brew tap jzaleski/homebrew-jzaleski
brew install apg

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
brew install font-iosevka

# custom scripts
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin/

# vim config
cp .vimrc $HOME/

# VS Code config file
cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"

# mongo cli
cp .mongorc.js $HOME/

# git
cp .gitconfig $HOME/
cp .gitconfig-personal $HOME/
cp .gitconfig-work $HOME/
cp .gitignore $HOME/


#
cp .zshrc $HOME/
