#!/bin/sh

ARCH=$(arch)


# install brew deps
brew install git tig
brew install gh
brew install stow
brew install direnv
brew install macvim mc
brew install go
brew install tmux
brew install ag fd bat eza tree watch p7zip tldr htop
brew install duf
brew install rg
brew install httpie
brew install ht-rust
brew install jq yq jless
brew install xq
brew install fzf
brew install nvm 
brew install speedtest-cli wifi-password
brew install vnc-viewer
brew install nmap
brew install python pyenv
brew install redis
brew install lazygit
brew install neofetch
brew install gping
# replacement for youtube-dl
brew install yt-dlp

brew install lulu
# chatgpt-cli https://github.com/kardolus/chatgpt-cli
brew tap kardolus/chatgpt-cli && brew install chatgpt-cli

# translate in shell
brew install translate-shell

# clouds
brew install yandex-cloud-cli

# k8s staff
brew install kubectl
brew install kubectx
brew install kube-ps1
brew install k9s
brew install krew
brew install minikube
brew install helm

# 
brew install mkcert

# casks
brew install jetbrains-toolbox
brew install visual-studio-code
brew install sublime-text
brew install keepassxc
brew install slack
brew install robo-3t
brew install dbeaver-community
#brew install tunnelbear
brew install transmission
#brew install rectangle
brew install telegram
brew install zoom
# brew install flycut
# brew install drovio
brew install google-chrome
brew install firefox
#brew install 1password
#brew install 1password-cli
brew install raycast
brew install obsidian
brew install hiddenbar

# postgresql
brew install postgresql
brew install pgcli
brew install pgadmin4

brew install rs/tap/curlie
brew install hurl
brew install lindell/multi-gitter/multi-gitter

# https://github.com/mongodb/homebrew-brew
brew install mongodb/brew/mongodb-community

# apg
brew tap jzaleski/homebrew-jzaleski
brew install apg

# https://github.com/cloudfoundry/homebrew-tap
#if [[ $ARCH != 'arm64' ]]
#then
#  brew install cloudfoundry/tap/bosh-cli
#  brew install cloudfoundry/tap/credhub-cli
#fi
brew install vlc
brew install android-file-transfer

# raspberry pi staff
brew install raspberry-pi-imager

# jwt staff
brew install mike-engel/jwt-cli/jwt-cli
brew tap jwt-rs/jwt-ui
brew install jwt-ui

# vpn staff
#brew install openvpn-connect
#brew install protonvpn
#brew install mullvadvpn

# install fonts
brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-monofur-nerd-font
brew install font-jetbrains-mono
brew install font-iosevka

# install python
pyenv install --skip-existing 3.11.4



# VS Code config file
#cp ./vscode/settings.json "$HOME/Library/Application Support/Code/User/"


# how delete:
#   stow -D <pkg-name> -t $HOME
# for example:
#   stow -D bindir -t $HOME
stow git -t $HOME
cp git/.gitignore $HOME/
stow zsh -t $HOME
stow bindir -t $HOME
stow vim -t $HOME
stow tmux -t $HOME
stow mongo -t $HOME
