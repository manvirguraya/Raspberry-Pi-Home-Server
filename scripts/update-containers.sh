#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Pulling latest container images..."
docker compose pull

echo "Restarting containers with updated images..."
docker compose up -d

echo "Removing unused Docker images..."
docker image prune -f

echo "Update complete."
docker compose ps
