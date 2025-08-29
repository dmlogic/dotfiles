#!/bin/bash

if [[ "$SHOULD_RESTORE" == true ]]; then
    cp ${RESTORE_FROM}.aliases ~/
else
    cp ${INSTALL_DIR}config/.aliases ~/
fi

if ! grep -Fxq 'source ~/.aliases' ~/.zshrc; then
    echo "source ~/.aliases" >> ~/.zshrc
fi
