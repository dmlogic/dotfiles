#!/bin/bash

echo -e "\n** Installing Docker\n"

install_docker() {
  yay -S --noconfirm --needed docker docker-compose docker-buildx

    # Limit log size to avoid running out of disk
    sudo mkdir -p /etc/docker
    echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

    # Start Docker automatically
    sudo systemctl enable docker

    # Give this user privileged Docker access
    sudo usermod -aG docker ${USER}

    # Prevent Docker from preventing boot for network-online.target
    sudo mkdir -p /etc/systemd/system/docker.service.d
    sudo tee /etc/systemd/system/docker.service.d/no-block-boot.conf <<'EOF'
    [Unit]
    DefaultDependencies=no
EOF

    sudo systemctl daemon-reload
}

install_lazydocker() {
    yay -S --noconfirm --needed lazydocker-bin
}

if ! command -v docker &>/dev/null; then
    install_docker
fi
if ! command -v lazydocker &>/dev/null; then
    install_lazydocker
fi
