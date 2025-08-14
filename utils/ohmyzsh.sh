#!/bin/bash

sudo apt -y install zsh

cd ~/Downloads && git clone git@github.com:powerline/fonts.git
./fonts/install.sh
rm -rf ~/Downloads/fonts

cd -

#rm -f ~/.zshrc
#rm -fr ~/.oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cat >> ~/.zshrc<< EOF

prompt_context() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)"
    fi
}
EOF

sed -i  's/^ZSH_THEME.*/ZSH_THEME="agnoster"/' ~/.zshrc

chsh -s $(which zsh)


