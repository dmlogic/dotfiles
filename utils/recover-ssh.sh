#!/bin/bash

if [ ! -d ~/.ssh ]; then
    mkdir -m 700 ~/.ssh
else
    cp -r ~/.ssh ~/.ssh-backup
fi

cp ${RESTORE_FROM}.ssh/* ~/.ssh/
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub
