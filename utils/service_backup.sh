#!/bin/bash

ENV_PATH="${INSTALL_DIR}.env"

# Cron to backup Immich to NAS
IMMICH_CRON_FILE="/etc/cron.d/immich_backup"
IMMICH_SCRIPT_PATH="${INSTALL_DIR}scripts/backup_immich.sh"

sudo rm $IMMICH_CRON_FILE
echo "0 2 * * * root $IMMICH_SCRIPT_PATH $ENV_PATH" | sudo tee -a "$IMMICH_CRON_FILE" > /dev/null
sudo chmod 644 "$CRON_FILE"


# Cron to backup Authentik to NAS
AUTHENTIK_CRON_FILE="/etc/cron.d/authentik_backup"
AUTHENTIK_SCRIPT_PATH="${INSTALL_DIR}scripts/backup_authentik.sh"

sudo rm $AUTHENTIK_CRON_FILE
echo "0 3 * * * root $AUTHENTIK_SCRIPT_PATH $ENV_PATH" | sudo tee -a "$AUTHENTIK_CRON_FILE" > /dev/null
sudo chmod 644 "$AUTHENTIK_CRON_FILE"
