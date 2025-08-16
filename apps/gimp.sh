#!/bin/bash

echo -e "\n** Installing Gimp\n"

sudo pacman -Sy --noconfirm --needed gimp

echo -e "\n** Installing Pinta\n"

yay -S --noconfirm --needed pinta ||
    echo -e "\e[31mFailed to install pinta. Continuing without!\e[0m"

