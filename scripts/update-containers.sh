#!/bin/bash

set -e

echo "Pulling latest Docker images..."
docker compose pull

echo "Restarting containers..."
docker compose up -d

echo "Removing unused Docker images..."
docker image prune -f

echo "Update complete."
