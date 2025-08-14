#!/bin/bash

VERSION="3.9.1"

cd ~/Downloads && wget https://github.com/balena-io/etcher/releases/download/v2.1.4/balena-etcher_2.1.4_amd64.deb
sudo apt install -y ./balena-etcher_2.1.4_amd64.deb

rm balena-etcher_2.1.4_amd64.deb

cd -


