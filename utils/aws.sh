#!/bin/bash

sudo pacman -Sy --noconfirm --needed aws-cli

if [[ "$SHOULD_RESTORE" == true ]]; then
    cp -r "${RESTORE_FROM}.aws" ~/
fi
