#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/.env"
    exit 1
fi

source "$1"

mkdir -p "$AUTHENTIC_BACKUP_PATH"

# Do not keep an endless history of database backups
(cd $AUTHENTIC_BACKUP_PATH && ls -t | tail -n +11 | xargs rm)

# run a new backup

## Create a dated filename for the backup
FILENAME="backup_$(date +%Y-%m-%d_%H-%M-%S).sql"
BACKUP_FILE="$AUTHENTIC_BACKUP_PATH/$FILENAME"

# Execute pg_dump inside the container and save the output to the host
docker exec \
  -e PGPASSWORD="$AUTHENTIK_PG_PASSWORD" \
  "$AUTHENTIK_PG_CONTAINER_NAME" \
  pg_dump \
    -U "$AUTHENTIK_PG_USER" \
    -d "$AUTHENTIK_PG_DB" \
    -F c -b -v -O -x > "$BACKUP_FILE" # Using custom format (-Fc) is recommended

# rclone to Goolge Drive
rclone sync $AUTHENTIC_BACKUP_PATH google-drive:Services/authentik
