#!/bin/bash

sudo add-apt-repository -y ppa:subsurface/subsurface-daily
sudo apt update -y
sudo apt install -y subsurface 

cp "${RECOVER_FOLDER}.subsurface/darren.xml" ~/.subsurface/darren.xml
