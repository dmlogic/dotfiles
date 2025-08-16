#!/bin/bash

copy_aliases() {
    cp ${RESTORE_FROM}.aliases ~/

    if ! grep -Fxq 'source ~/.aliases' ~/.zshrc; then
        echo "source ~/.aliases" >> ~/.zshrc
    fi
}

if [[ "$SHOULD_RESTORE" == true ]]; then
    copy_aliases
fi
