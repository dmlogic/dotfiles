#!/bin/bash

source .env
TARGET="$RESTORE_FROM"

echo "Copying coding projects"
rsync -a --info=progress2 --exclude="node_modules" --exclude="vendor" ~/Code $TARGET

echo "Copying documents"
rsync -a --info=progress2 --exclude="node_modules" --exclude="vendor"  ~/Documents $TARGET

echo "Copying SSH settings"
rsync -a --info=progress2 ~/.ssh $TARGET

echo "Copying AWS credentials"
rsync -a --info=progress2 ~/.aws $TARGET

echo "Copying Subsurface data"
rsync -a --info=progress2 ~/snap/subsurface/current/.subsurface $TARGET

# Terminal history
cp ~/.aliases $TARGET
cp ~/.zhistory $TARGET
