#!/bin/bash
set -e

echo "Updating packages..."
sudo apt update

echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Setting up Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker..."
sudo apt update

sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "Starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Creating docker group if it doesn't exist..."
if ! getent group docker > /dev/null; then
    sudo groupadd docker
fi

echo "Adding user '$USER' to docker group..."
sudo usermod -aG docker "$USER"

echo "Checking Docker version..."
docker --version

echo
echo "Docker installation completed."
echo "Log out and log back in (or run 'newgrp docker')"
echo "before using Docker without sudo."
echo
echo "Test it with:"
echo "docker run hello-world"



```
nano install-docker.sh
chmod +x install-docker.sh
./install-docker.sh
```
