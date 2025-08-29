#!/bin/bash

echo -e "\n** Installing Terminal tools\n"

sudo pacman -S --noconfirm --needed ghostty

if [[ ! -f "~/.config/ghostty/config" ]]; then
    mkdir ~/.config/ghostty
    cat >> ~/.config/ghostty/config<< EOF
    adjust-cell-height = 40%
    background-opacity = 0.9
    cursor-color = #75d1ff
    cursor-style = block_hollow
    font-family = "Adwaita Mono"
    theme = MaterialOcean
    window-height = 40
    window-width = 150
    working-directory = "/home/darren/Code"
EOF
fi
