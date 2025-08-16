#!/bin/bash

echo -e "\n** Installing Essentials\n"

yay -S --noconfirm --needed \
  wget curl unzip jq \
  wl-clipboard fastfetch btop \
  man less whois gum base-devel 

sudo pacman -Sy --noconfirm --needed nmap base-devel
