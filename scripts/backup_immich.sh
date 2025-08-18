#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/.env"
    exit 1
fi

source "$1"

# copy new files to the NAS
echo -e "** Backing up Immich to NAS"
rsync -av --delete $IMMICH_LIBRARY_PATH $IMMICH_BACKUP_PATH


# rclone to Goolge Drive
