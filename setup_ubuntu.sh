#!/bin/bash

sudo apt update
sudo apt upgrade -y

./setup_git.sh

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
curl https://pyenv.run | bash

sudo add-apt-repository ppa:solaar-unifying/stable

curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

sudo apt-get install wget gpg
wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm warpdotdev.gpg
sudo apt update && sudo apt install warp-terminal

sudo apt install 1password -y
sudo apt install fonts-firacode -y
sudo apt install gh -y
sudo apt install gir1.2-gda-5.0 gir1.2-gsound-1.0 # for pano
sudo apt install gnome-tweaks -y
sudo apt install golang -y
sudo apt install htop -y
sudo apt install papirus-icon-theme -y
sudo apt install pipx -y
sudo apt install postgresql -y
sudo apt install rbenv -y
sudo apt install solaar -y
sudo apt install transmission -y
sudp apt install gnome-browser-connector -y

sudo add-apt-repository multiverse
sudo apt install steam -y

sudo snap install code --classic
sudo snap install discord
sudo snap install docker
sudo snap install spotify

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

cp -rf ./config/.bashrc ~/.bashrc
source ~/.bashrc

# setup node
nvm install --lts
nvm use --lts

# setup ruby
rbenv install 3.1.2
rbenv global 3.1.2

# setup python
pyenv install 3.12
pyenv global 3.12

# setup poetry
pipx install poetry

# setup vs code
./setup_code.sh

# setup mx master 3
cp -rf ./config/solaar_rules.yaml ~/.config/solaar/rules.yaml
