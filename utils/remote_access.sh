#!/bin/bash

# This file is only relevant if you need to connect to the internal NAS
# and/ or Google Drive

# It assumes that you a RSA name id_rsa setup and tested to access the NAS with admin@

sudo pacman -Sy --noconfirm --needed vim sshfs

mount_nas() {
    if [ -z "$NAS_USER" ] || [ -z "$NAS_HOST" ] || [ -z "$NAS_MOUNT_POINT" ] || [ -z "$NAS_SHARE" ]; then
        echo "NAS configuration variables are not set. Please check your .env file."
        return 1
    fi

    echo -e "\n** Mounting NAS at $NAS_MOUNT_POINT **\n"


    sudo mkdir -p $NAS_MOUNT_POINT
    MOUNTSTRING="$NAS_USER@$NAS_HOST:$NAS_SHARE   $NAS_MOUNT_POINT   fuse.sshfs   _netdev,noauto,x-systemd.automount,allow_other,default_permissions,uid=1000,gid=1000,identityfile=/root/.ssh/id_rsa   0 0"
    echo "$MOUNTSTRING" | sudo tee -a /etc/fstab > /dev/null
}

if [ -d "$NAS_MOUNT_POINT" ]; then
    mount_nas
fi

