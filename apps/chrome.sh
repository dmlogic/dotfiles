#!/bin/bash

echo -e "\n** Installing Google Chrome\n"

yay -S --noconfirm --needed google-chrome

xdg-settings set default-web-browser com.google.Chrome.desktop ||
    echo -e "\e[31mFailed to set Google Chrome as default browser. Continuing without!\e[0m"
