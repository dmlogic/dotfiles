#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/.env"
    exit 1
fi

source "$1"

# Do not keep an endless history of database backups
rm $IMMICH_BACKUP_PATH/library/backups/*.gz


# copy new files to the NAS
echo -e "** Backing up Immich to NAS"
rsync -av $IMMICH_LIBRARY_PATH $IMMICH_BACKUP_PATH


# rclone to Goolge Drive
rclone copy $IMMICH_LIBRARY_PATH/upload google-drive:Services/immich/upload
