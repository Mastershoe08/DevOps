#!/bin/bash

set -e

echo " Updating package lists..."

sudo apt-get update
sudo apt-get install ca-certificates curl

echo " Setting up Docker GPG key..."

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo " Adding docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo " Installing Docker Engine and compose plugin..."
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


if ! groups $USER | grep -q "\bdocker\b"; then
    echo "[+] Adding $USER to docker group (logout required to take effect)..."
    sudo usermod -aG docker $USER
fi

echo "[✓] Docker installed successfully!"

