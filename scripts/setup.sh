#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Creating required project folders..."
mkdir -p \
  data/pihole/etc-pihole \
  data/pihole/etc-dnsmasq.d \
  data/plex/config \
  data/portainer \
  data/prometheus \
  data/grafana \
  data/nginx-proxy-manager/data \
  data/nginx-proxy-manager/letsencrypt \
  media/movies \
  media/tv \
  media/music \
  backups

if [ ! -f .env ]; then
  echo "Creating .env from .env.example..."
  cp .env.example .env
  echo "Edit .env before starting services: nano .env"
else
  echo ".env already exists. Leaving it unchanged."
fi

echo "Making scripts executable..."
chmod +x scripts/*.sh

echo "Validating Docker Compose file..."
docker compose config >/dev/null

echo "Setup complete. Next steps:"
echo "1. Edit .env: nano .env"
echo "2. Start services: ./scripts/start-services.sh"
