#!/bin/bash
SOURCE="/media/darren/STICK"

sudo apt update
sudo apt upgrade

# # https://jumpcloud.com/blog/how-to-upgrade-ubuntu-22-04-to-ubuntu-24-04
# # Copy over ssh creds and set permissions
# # @see https://jonasbn.github.io/til/ssh/permissions_on_ssh_folder_and_files.html
cp -r "${SOURCE}/.ssh" ~/


chmod 700 ~/.ssh
chmod 644 ~/.ssh/*.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/github
chmod 600 ~/.ssh/known_hosts

# # Install git and copy over creds
sudo apt -y install git-all curl
cp "${SOURCE}/.gitconfig" ~/.gitconfig
cp "${SOURCE}/.gitignore" ~/.gitignore

# # Install aws cli and copy over creds
cd ~/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
cp -r "${SOURCE}/.aws" ~/


# Install ohmyZsh
# sudo apt install -y zsh fonts-powerline
cd ~/Downloads && git clone git@github.com:powerline/fonts.git && cd fonts
./install.sh
cd ../ && rm -rf fonts
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp "${SOURCE}/.zshrc" ~/.zshrc
cp -r "${SOURCE}/.oh-my-zsh" ~/

# Install TLP battery management
sudo apt install -y tlp tlp-rdw

# Terminator and config
sudo apt install -y terminator
cp "${SOURCE}/terminator/config" ~/.config/terminator/config


# PHP ppa and install
# sudo add-apt-repository ppa:ondrej/php
# sudo apt update
sudo apt install -y php-cli sqlite3
sudo apt install -y php-ctype php-curl php-dom php-mbstring php-tokenizer php-xml php-pcre php-zip php-sqlite3 php-xdebug
sudo apt install -y pear-php
sudo apt install -y php-pear
sudo pecl channel-update pecl.php.net

# Composer
curl -sLS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Node
sudo apt install -y nodejs && npm install -g npm
sudo apt install -y mysql-client

# Angry IP
# https://angryip.org/download/#linux

# Balena Etcher
# https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-1.18.11-x64.AppImage 
# https://davidmatthew.ie/how-to-launch-an-appimage-ubuntu/
sudo apt install -y libfuse2

# Calibre
sudo apt install -y calibre

# DBeaver

# # Filezilla
sudo apt install -y filezilla

# # Gimp
sudo apt install -y gimp

# # Inkskape
sudo apt install -y inkscape

# # Insomnia

# # Libre Office
sudo apt install -y libreoffice

# # Meld
sudo apt install -y meld

# # transmission
sudo apt install -y transmission

# # Raspi imager
sudo apt install -y rpi-imager

# # Spotify
snap install spotify

# # Subsurface
snap install subsurface

# Docker
# https://docs.docker.com/engine/install/ubuntu/
## Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

##   Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## Post installation
#https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# sudo apt install -y uidmap

# DDEV
sudo apt install -y mkcert
curl -fsSL https://pkg.ddev.com/apt/gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ddev.gpg > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/ddev.gpg] https://pkg.ddev.com/apt/ * *" | sudo tee /etc/apt/sources.list.d/ddev.list
sudo apt update && sudo apt install -y ddev


# mkcert may not be properly installed, 
# we suggest installing it for trusted https support,
# `brew install mkcert nss`, `choco install -y mkcert`, etc.
# and then `mkcert -install` 
