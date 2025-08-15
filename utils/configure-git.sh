#!/bin/bash

echo -e "\n** Configuring git\n"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

cat << EOF > ~/.gitignore
_todo.md
.env
node_modules
vendor
EOF

yay -S --noconfirm --needed \
  github-cli \
  lazygit
