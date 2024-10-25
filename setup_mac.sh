#!/bin/bash

./setup_git.sh

# install xcode command line tools
xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install homebrew packages
brew install gh
brew install htop
brew install node
brew install speedtest-cli

brew install corepack
corepack enable pnpm

brew install --cask 1password
brew install --cask arc
brew install --cask discord
brew install --cask docker
brew install --cask iterm2
brew install --cask logi-options-plus
brew install --cask maccy
brew install --cask messenger
brew install --cask mongodb-compass
brew install --cask nordvpn
brew install --cask spotify
brew install --cask transmission
brew install --cask visual-studio-code

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

cp -f ./config/.zshrc ~/.zshrc
source ~/.zshrc

# setup vs code
./setup_code.sh