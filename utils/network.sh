#!/bin/bash

# This script enables *.localhost names to be resolved on the local network

# 1. Install nss-mdns
sudo pacman -Sy --noconfirm nss-mdns

# 2. Edit resolved.conf
sudo sed -i -e 's/^#*MulticastDNS=.*/MulticastDNS=yes/' /etc/systemd/resolved.conf

# 3. Enable and Start the Service:
sudo systemctl enable --now systemd-resolved.service

# 4. Configure Name Service Switch (NSS):
# was:
# hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns
sudo sed -i -e '/^hosts:/c\hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files dns myhostname' /etc/nsswitch.conf

# 5. Symlink resolv.conf
sudo cp /etc/resolv.conf /etc/resolve.conf.bak
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
