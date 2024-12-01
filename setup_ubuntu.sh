#!/bin/bash

sudo apt update
sudo apt upgrade -y

./setup_git.sh

type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

sudo apt install curl
sudo apt install fonts-firacode -y
sudo apt install gnome-tweaks -y
sudo apt install nodejs -y
sudo apt install papirus-icon-theme -y
sudo apt install gnome-browser-connector -y

sudo snao install 1password
sudo snap install code --classic
sudo snap install discord
sudo snap install docker
sudo snap install htop
sudo snap install nordvpn
sudo snap install nvtop
sudo snap install spotify
sudo snap install steam
sudo snap install transmission

snap connect nvtop:system-observe
snap connect nvtop:process-control
snap connect nvtop:kubernetes-support
snap connect nvtop:hardware-observe

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# download and install Node.js (you may need to restart the terminal)
nvm install 22

# enable pnpm
corepack enable pnpm

# setup gnome terminal profile
dconf load /org/gnome/terminal/ < gnome_terminal_settings.txt

# setup bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
cp -rf ./config/.bashrc ~/.bashrc
source ~/.bashrc

# setup vs code
./setup_code.sh

# setup mx master 3
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt install solaar -y
cp -rf ./config/solaar_rules.yaml ~/.config/solaar/rules.yaml
sudo wget https://raw.githubusercontent.com/pwr-Solaar/Solaar/master/rules.d-uinput/42-logitech-unify-permissions.rules -O /etc/udev/rules.d/42-logitech-unify-permissions.rules
gnome-extensions install https://extensions.gnome.org/extension-data/solaar-extension%40sidevesh.shell-extension.zip
gnome-extensions enable solaar-extension@sidevesh

