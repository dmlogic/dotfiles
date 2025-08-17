#!/bin/bash

clear

INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

# Get our install requirements
if [[ ! -f "$INSTALL_DIR.env" ]]; then
    echo "Error: $INSTALL_DIR.env not found."
    exit 1
fi
source $INSTALL_DIR.env

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
    source $INSTALL_DIR/utils/recover-ssh.sh
fi

source $INSTALL_DIR/utils/aur.sh
source $INSTALL_DIR/utils/essentials.sh
source $INSTALL_DIR/utils/configure-git.sh
source $INSTALL_DIR/utils/docker.sh
source $INSTALL_DIR/utils/ohmyzsh.sh
source $INSTALL_DIR/utils/terminal.sh
source $INSTALL_DIR/utils/webdev.sh
source $INSTALL_DIR/utils/aws.sh

source $INSTALL_DIR/apps/code.sh
source $INSTALL_DIR/apps/chrome.sh
source $INSTALL_DIR/apps/liveusb.sh
source $INSTALL_DIR/apps/gimp.sh
source $INSTALL_DIR/apps/inkscape.sh
source $INSTALL_DIR/apps/office.sh
source $INSTALL_DIR/apps/spotify.sh
source $INSTALL_DIR/apps/subsurface.sh
source $INSTALL_DIR/apps/meld.sh
source $INSTALL_DIR/apps/dbeaver.sh
source $INSTALL_DIR/apps/discord.sh

if [[ "$SHOULD_RESTORE" == true ]] && [[ "$RECOVER_DOCS" == true ]]; then
    rsync -a --info=progress2 ${RESTORE_FROM}Code ~/
    rsync -a --info=progress2 ${RESTORE_FROM}Documents ~/
fi

# Optional scripts
# source $INSTALL_DIR/utils/remote_access.sh
