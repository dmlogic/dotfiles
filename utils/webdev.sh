#!/bin/bash

# @see https://wiki.archlinux.org/title/PHP

echo -e "\n** Installing Web dev tooling\n"

install_php() {
  yay -Sy php composer php-sqlite xdebug --noconfirm --needed

  # Install Path for Composer
  if [[ ":$PATH:" != *":$HOME/.config/composer/vendor/bin:"* ]]; then
    echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >>"$HOME/.bashrc"
    source "$HOME/.bashrc"
    echo "Added Composer global bin directory to PATH."
  else
    echo "Composer global bin directory already in PATH."
  fi

  # Enable some extensions
  local php_ini_path="/etc/php/php.ini"
  local extensions_to_enable=(
    "bcmath"
    "gd"
    "iconv"
    "intl"
    "opcache"
    "openssl"
    "pdo_mysql"
    "pdo_sqlite"
    "xdebug"
  )

  for ext in "${extensions_to_enable[@]}"; do
    sudo sed -i "s/^;extension=${ext}/extension=${ext}/" "$php_ini_path"
  done
}

install_node() {
  latest_nvm_version=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$latest_nvm_version/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  current_lts_node_version=$(nvm ls-remote --lts | tail -1 )
  version=$(echo "$current_lts_node_version" | grep -oP 'v\d+\.\d+\.\d+')
  nvm install $version
}


install_php
composer global require laravel/installer
install_node

