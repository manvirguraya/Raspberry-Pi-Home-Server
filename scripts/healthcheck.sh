#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Docker Compose status:"
docker compose ps

echo ""
echo "HTTP service checks:"
check_url() {
  local name="$1"
  local url="$2"

  if curl -fsS --max-time 5 "$url" >/dev/null; then
    echo "[OK]   $name - $url"
  else
    echo "[WARN] $name did not respond at $url"
  fi
}

check_url "Pi-hole" "http://localhost:8080/admin/"
check_url "Plex" "http://localhost:32400/web/"
check_url "Grafana" "http://localhost:3000/"
check_url "Prometheus" "http://localhost:9090/"
check_url "cAdvisor" "http://localhost:8081/"
check_url "Nginx Proxy Manager" "http://localhost:81/"

echo ""
echo "Container resource usage:"
docker stats --no-stream || true
