#!/bin/bash

GHOSTTY_VERSION="ghostty_1.1.3-0.ppa2_amd64_24.04.deb"


cd ~/Downloads && wget https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/$GHOSTTY_VERSION

sudo apt -y install ./$GHOSTTY_VERSION

gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/ghostty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"

cd -

cat >> ~/.config/ghostty/config<< EOF
adjust-cell-height = 40%
# background = #000000
# foreground = #EEEEEC
background-opacity = 0.9
# background-blur = true
cursor-style = block_hollow
cursor-color = #75d1ff
# cursor-style-blink = true
font-family = "Ubuntu Mono derivative Powerline"
theme = MaterialOcean
EOF

