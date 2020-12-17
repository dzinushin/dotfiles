#!/bin/sh

# install brew deps
brew install git \
    macvim \
    python \
    go \
    mc \
    bat \
    httpie \
    p7zip \
    jq \
    yq \
    fzf \
    nvm \
    watch \
    tig \
    fd \
    wifi-password

# optionally also can be installed: use-engine zoomus
brew cask install \
    jetbrains-toolbox \
    visual-studio-code \
    keepassxc \
    slack \
    sublime-text \
    robo-3t \
    tunnelbear \
    transmission \
    rectangle

# https://github.com/mongodb/homebrew-brew
brew install \
    cloudfoundry/tap/bosh-cli \
    cloudfoundry/tap/credhub-cli \
    mongodb/brew/mongodb-community

# install fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-monofur-nerd-font
brew cask install font-jetbrains-mono

# custom scripts
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin/

# vim config
cp .vimrc $HOME/

# VS Code config file
cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"

# mongo cli
cp .mongorc.js $HOME/
