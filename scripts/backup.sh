#!/bin/bash

set -e

BACKUP_DIR="$HOME/pi-server-backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
PROJECT_DIR=$(pwd)

mkdir -p "$BACKUP_DIR"

echo "Creating backup..."
tar -czf "$BACKUP_DIR/home-server-backup-$DATE.tar.gz" \
  --exclude="./media" \
  --exclude="./data/jellyfin/cache" \
  ./data ./configs .env docker-compose.yml

echo "Backup saved to: $BACKUP_DIR/home-server-backup-$DATE.tar.gz"
