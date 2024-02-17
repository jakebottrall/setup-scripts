#!/bin/bash

./setup_git.sh

# install xcode command line tools
xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew packages
brew install gh
brew install go
brew install htop
brew install nvm
brew install pipx
brew install pnpm
brew install pyenv
brew install rbenv
brew install ruby-build
brew install speedtest-cli

brew install --cask 1password
brew install --cask arc
brew install --cask discord
brew install --cask docker
brew install --cask logi-options-plus
brew install --cask maccy
brew install --cask messenger
brew install --cask mongodb-compass
brew install --cask nordvpn
brew install --cask spotify
brew install --cask transmission
brew install --cask visual-studio-code
brew install --cask warp
brew install --cask whatsapp

brew tap oven-sh/bun
brew install bun

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

cp -f ./profiles/.zshrc ~/.zshrc
source ~/.zshrc

# setup node
mkdir ~/.nvm
nvm install --lts
nvm use --lts

# setup ruby
rbenv init
rbenv install 3.2.2
rbenv global 3.2.2

# setup python
pyenv install 3.12
pyenv global 3.12

# setup poetry
pipx install poetry

# start services
brew services start postgresql@15

# setup vs code
./setup_code.sh