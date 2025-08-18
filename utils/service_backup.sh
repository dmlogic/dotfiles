#!/bin/bash

# Cron to backup Immich to NAS
CRON_FILE="/etc/cron.d/immich_backup"
SCRIPT_PATH="${INSTALL_DIR}scripts/backup_immich.sh"
ENV_PATH="${INSTALL_DIR}.env" # <-- update this path as needed

sudo rm $CRON_FILE
echo "0 2 * * * root $SCRIPT_PATH $ENV_PATH" | sudo tee -a "$CRON_FILE" > /dev/null
sudo chmod 644 "$CRON_FILE"


# Cron to backup Authentik to NAS
# @todo
