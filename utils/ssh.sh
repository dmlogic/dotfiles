#!/bin/bash

## Copy .ssh
cp "${RECOVER_FOLDER}.ssh/id_rsa" ~/.ssh/darren_rsa
cp "${RECOVER_FOLDER}.ssh/github" ~/.ssh/github
chmod 600 ~/.ssh/*

cp "${RECOVER_FOLDER}.ssh/id_rsa.pub" ~/.ssh/darren_rsa.pub
cp "${RECOVER_FOLDER}.ssh/github" ~/.ssh/github.pub
chmod 644 ~/.ssh/*.pub

cat << EOF > ~/.ssh/config
IdentityFile ~/.ssh/darren_rsa

Host github.com   
    HostName github.com
    User git
    IdentityFile ~/.ssh/github
EOF

chmod 600 ~/.ssh/config
