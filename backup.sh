#!/bin/bash

# TARGET="/media/darren/orange/pre-2404-backup/"
TARGET="/media/darren/STICK/"

# accept target backup folder

echo "Copying coding projects"
rsync -a --info=progress2 --exclude="node_modules" --exclude="vendor" ~/Code $TARGET

echo "Copying documents"
rsync -a --info=progress2 --exclude="node_modules" --exclude="vendor"  ~/Documents $TARGET

echo "Copying SSH settings"
rsync -a --info=progress2 ~/.ssh $TARGET

echo "Copying Terminator settings"
mkdir "${TARGET}terminator"
rsync -a --info=progress2 ~/.config/terminator/config "${TARGET}terminator/"

cp ~/.gitconfig $TARGET
cp ~/.gitignore $TARGET

echo "Copying AWS credentials"
rsync -a --info=progress2 ~/.aws $TARGET

echo "Copying Subsurface data"
rsync -a --info=progress2 ~/snap/subsurface/current/.subsurface $TARGET

echo "Copying fly.io credentials"
rsync -a --info=progress2 ~/.fly $TARGET

echo "Copying zsh settings"
rsync -a --info=progress2 ~/.oh-my-zsh $TARGET

echo "Copying VS Code settings"
rsync -a --info=progress2 ~/.vscode $TARGET

echo "Copying Insomnia data"
rsync -a --info=progress2 ~/snap/insomnia/current $TARGET

# Terminal history
cp ~/.aliases $TARGET
cp ~/.bash_history $TARGET
cp ~/.zsh_history $TARGET
cp ~/.zshrc $TARGET
