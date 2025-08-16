#!/bin/bash

clear
echo -e "\n*** DOWNLOADING DOTFILES REPO ***\n"

# We absolutely must have git
if ! command -v git &>/dev/null; then
    sudo pacman -S --noconfirm --needed git
fi

SOURCE_REPO="dmlogic/dotfiles"

rm -rf ~/.local/share/dotfiles/
git clone "https://github.com/${SOURCE_REPO}.git" ~/.local/share/dotfiles >/dev/null
