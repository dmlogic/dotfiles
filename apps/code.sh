#!/bin/bash

echo -e "\n** Installing VS Code\n"

yay -S --noconfirm --needed visual-studio-code-bin

if [[ "$SHOULD_RESTORE" == true ]]; then
    cp $INSTALL_DIR/config/vscode/settings.json ~/.config/Code/User/settings.json
    cp $INSTALL_DIR/config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
fi

code --install-extension bmewburn.vscode-intelephense-client --force
code --install-extension xdebug.php-debug --force
code --install-extension eamodio.gitlens --force
code --install-extension yzhang.markdown-all-in-one --force
code --install-extension tomoki1207.pdf --force
