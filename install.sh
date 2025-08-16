#!/bin/bash

clear

# Get our install requirements
source .env

# We absolutely must have git
if ! command -v git &>/dev/null; then
    sudo pacman -Sy --noconfirm --needed git
fi

set -e

# Give some feedback if it errors
catch_errors() {
  echo -e "\n\e[31mInstallation failed!\e[0m"
}
trap catch_errors ERR

# Set an ENV var for whether we are restoring
if [[ -n "$RESTORE_FROM" ]]; then
    SHOULD_RESTORE=true
else
    SHOULD_RESTORE=false
fi

# Copy over ssh if we've asked to
if [[ "$SHOULD_RESTORE" == true ]] && [[ "$RECOVER_SSH" == true ]]; then
    source ./utils/recover-ssh.sh
fi

source ./utils/aur.sh
source ./utils/power.sh
# source ./utils/essentials.sh
# source ./utils/configure-git.sh
# source ./utils/docker.sh
# source ./utils/ohmyzsh.sh
# source ./utils/terminal.sh
# source ./utils/webdev.sh
source ./utils/configure-desktop.sh

# source ./apps/angry-ip.sh
# #source ./apps/code.sh
# source ./apps/etcher.sh
# source ./apps/gimp.sh
# source ./apps/inkscape.sh
# source ./apps/office.sh
# source ./apps/spotify.sh
# source ./apps/subsurface.sh


# todo
# timeshift
# Chrome
# bitwarden
# dbeaver
# gnome tweaks
# git auth
# aliases
# aws cli
# Google drive integration
# webapps for WhatsApp, YouTube
