#!/usr/bin/env bash
set -euo pipefail

echo "Updating package list..."
sudo apt update

echo "Installing required packages..."
sudo apt install -y ca-certificates curl gnupg git

echo "Installing Docker using the official convenience script..."
curl -fsSL https://get.docker.com | sh

echo "Adding current user to the docker group..."
sudo usermod -aG docker "$USER"

echo "Installing Docker Compose plugin..."
sudo apt install -y docker-compose-plugin

echo "Checking Docker versions..."
docker --version || true
docker compose version || true

echo "Docker install complete. Log out and back in, or reboot, before running Docker without sudo."
