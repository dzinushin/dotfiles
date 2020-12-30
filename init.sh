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
    wifi-password \
    speedtest-cli

brew install redis

# optionally also can be installed: use-engine zoomus
brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask keepassxc
brew install --cask slack
brew install --cask sublime-text
brew install --cask robo-3t
brew install --cask tunnelbear
brew install --cask transmission
brew install --cask rectangle
brew install --cask use-engine
brew install --cask zoomus

# https://github.com/mongodb/homebrew-brew
brew install cloudfoundry/tap/bosh-cli
brew install cloudfoundry/tap/credhub-cli
brew install mongodb/brew/mongodb-community

# install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-monofur-nerd-font
brew install --cask font-jetbrains-mono

# custom scripts
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin/

# vim config
cp .vimrc $HOME/

# VS Code config file
cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"

# mongo cli
cp .mongorc.js $HOME/
