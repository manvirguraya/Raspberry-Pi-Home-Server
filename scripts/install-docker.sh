#!/bin/bash

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Docker..."
curl -fsSL https://get.docker.com | sh

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "Installing Docker Compose plugin..."
sudo apt install docker-compose-plugin -y

echo "Docker installation complete."
echo "Please reboot or log out and back in for group changes to apply."