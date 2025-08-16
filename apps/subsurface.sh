#!/bin/bash

echo -e "\n** Installing Subsurface\n"

yay -S --noconfirm --needed subsurface-git

if [[ "$SHOULD_RESTORE" == true ]]; then
    cp "${RESTORE_FROM}.subsurface/darren.xml" ~/.subsurface/darren.xml
fi
