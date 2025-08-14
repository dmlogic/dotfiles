#!/bin/bash

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt-get install -y php8.4-common php8.4-opcache php8.4-cli php8.4-dev php8.4-sqlite3 php8.4-gd php8.4-curl php8.4-imap php8.4-mysql php8.4-mbstring php8.4-xml php8.4-zip php8.4-bcmath php8.4-intl php8.4-readline php8.4-msgpack php8.4-igbinary php8.4-redis php8.4-swoole php8.4-memcached php8.4-pcov php8.4-imagick php8.4-xdebug
       

# NODE

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
#nvm install v22.18.0
