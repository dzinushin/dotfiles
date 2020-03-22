#!/bin/sh

# install brew deps
brew install git \
    python \
    mc \
    bat \
    httpie \
    p7zip \
    jq \
    fzf \
    nvm

# optionally also can be installed: use-engine zoomus
brew cask install \
    jetbrains-toolbox \
    visual-studio-code \
    keepassxc \
    slack \
    sublime-text \
    robo-3t \
    tunnelbear

brew install \
    cloudfoundry/tap/bosh-cli \
    cloudfoundry/tap/credhub-cli \
    mongodb/brew/mongodb-community-shell # https://github.com/mongodb/homebrew-brew

# install fonts
cd $HOME/Library/fonts && 
curl --silent -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Bold.ttf &&  \
curl --silent -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Light.ttf && \
curl --silent -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Medium.ttf && \
curl --silent -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Regular.ttf && \
curl --silent -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Retina.ttf
cd -

# custom scripts
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin/

# VS Code config file
cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"

# mongo cli
cp .mongorc.js $HOME/