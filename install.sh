#!/bin/bash

clear
echo -e "\n*** PROVISIONING YOUR PC ***\n"

# We absolutely must have git
if ! command -v git &>/dev/null; then
    sudo pacman -S --noconfirm --needed git
fi

SOURCE_REPO="dmlogic/dotfiles"

echo -e "\nCloning dotfiles from: https://github.com/${SOURCE_REPO}.git"
rm -rf ~/.local/share/dotfiles/
git clone "https://github.com/${SOURCE_REPO}.git" ~/.local/share/dotfiles >/dev/null
