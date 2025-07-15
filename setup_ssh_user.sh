#!/bin/bash

set -e

USERNAME="tester"
SSH_PUB_KEY="
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8NlACgXEkUPWZCgH8ajQyWCWT9reHDX5TPPsQCz2ZX codys@cody-ms7b93
"

echo " Installing SSH server"

apt-get update
apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

echo "Creating user: $USERNAME"
sudo adduser --disable-password --gecos "" $USERNAME

echo "Adding user to grouop"
sudo usermod -aG sudo $USERNAME

echo "Setting up SSH key for $USERNAME"

sudo mkdir -p /home/$USERNAME/.ssh
echo "$SSH_PUB_KEY" | sudo tee /home/$USERNAME/.ssh/authorized_keys > /dev/null
sudo chmod 700 /home/$USERNAME/.ssh
sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

sudo systemctl restart ssh

