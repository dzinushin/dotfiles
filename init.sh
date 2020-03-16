#!/bin/sh

# install brew deps
brew install git mc bat httpie p7zip python

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
mkdir -p ~/bin
cp ./bin/* ~/bin/