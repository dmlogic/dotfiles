#!/bin/bash

VERSION="3.9.1"

cd ~/Downloads && wget https://github.com/angryip/ipscan/releases/download/3.9.1/ipscan_3.9.1_amd64.deb
sudo apt install -y ./ipscan_3.9.1_amd64.deb

rm ipscan_3.9.1_amd64.deb

cd -


