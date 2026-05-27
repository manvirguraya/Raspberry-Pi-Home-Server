#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

BACKUP_DIR="./backups"
DATE="$(date +"%Y-%m-%d_%H-%M-%S")"
BACKUP_FILE="$BACKUP_DIR/home-server-backup-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "Creating backup at $BACKUP_FILE..."

tar --exclude="$BACKUP_DIR" -czf "$BACKUP_FILE" \
  docker-compose.yml \
  .env \
  configs \
  data

echo "Backup complete:"
ls -lh "$BACKUP_FILE"
