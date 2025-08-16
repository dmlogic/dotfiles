#!/bin/bash

echo -e "\n** Installing Spotify\n"

yay -S --noconfirm --needed spotify ||
    echo -e "\e[31mFailed to install spotify. Continuing without!\e[0m"
