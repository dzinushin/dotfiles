#!/bin/sh

# install brew deps
brew install git mc bat httpie p7zip python jq fzf

brew cask install \
    jetbrains-toolbox \
    visual-studio-code \
    keepassxc \
    slack \
    sublime-text \
    robo-3t

brew install \
    cloudfoundry/tap/bosh-cli \
    cloudfoundry/tap/credhub-cli

# custom scripts
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin/

# install fonts
cd $HOME/Library/fonts && \
curl -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Bold.ttf && \
curl -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Light.ttf && \
curl -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Medium.ttf && \
curl -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Regular.ttf && \
curl -O https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-Retina.ttf
cd -

# VS Code config file
cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"
