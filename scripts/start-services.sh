#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ ! -f .env ]; then
  echo "Missing .env file. Run ./scripts/setup.sh first or copy .env.example to .env."
  exit 1
fi

echo "Starting home server services..."
docker compose up -d

echo "Running containers:"
docker compose ps
