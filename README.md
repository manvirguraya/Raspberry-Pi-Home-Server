# Raspberry Pi Home Server

A self-hosted Raspberry Pi server that runs network and media services using Docker. This project includes Pi-hole for network-wide ad blocking, Jellyfin for media streaming, Portainer for container management, Grafana and Prometheus for monitoring, and Nginx Proxy Manager for reverse proxy management.

## Project Description

This project demonstrates how a Raspberry Pi can be used as a small home server for networking, media, monitoring, and self-hosted services. It uses Docker Compose to run each service in its own container, making the setup easier to deploy, update, and manage.

## Features

- Network-wide ad blocking with Pi-hole
- Local media streaming with Jellyfin
- Docker container management with Portainer
- System monitoring dashboards with Grafana
- Metrics collection with Prometheus
- Reverse proxy management with Nginx Proxy Manager
- Automated updates, backups, and health checks using Bash scripts
- Secure remote administration through SSH or optional VPN tools like Tailscale

## Technologies Used

- Raspberry Pi OS
- Linux
- Docker
- Docker Compose
- Bash
- YAML
- Pi-hole
- Jellyfin
- Portainer
- Grafana
- Prometheus
- Nginx Proxy Manager

## Architecture

```txt
Internet
   |
Router
   |
Raspberry Pi
   |-- Pi-hole DNS Ad Blocking
   |-- Jellyfin Media Server
   |-- Portainer Docker Management
   |-- Grafana Monitoring Dashboard
   |-- Prometheus Metrics Collection
   |-- Nginx Proxy Manager Reverse Proxy
```

## Repository Structure

```txt
raspberry-pi-home-server/
|
|-- README.md
|-- docker-compose.yml
|-- .env.example
|-- .gitignore
|
|-- configs/
|   |-- prometheus/
|   |   |-- prometheus.yml
|   |
|   |-- nginx-proxy-manager/
|       |-- README.md
|
|-- docs/
|   |-- network-setup.md
|   |-- troubleshooting.md
|   |-- resume-bullets.md
|
|-- scripts/
|   |-- backup.sh
|   |-- update-containers.sh
|   |-- healthcheck.sh
|
|-- screenshots/
|   |-- .gitkeep
```

## Setup Instructions

### 1. Install Docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
```

Log out and back in after running the commands above.

### 2. Install Docker Compose

```bash
sudo apt update
sudo apt install docker-compose-plugin -y
```

### 3. Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/raspberry-pi-home-server.git
cd raspberry-pi-home-server
```

### 4. Create the Environment File

```bash
cp .env.example .env
```

Edit the `.env` file and change the passwords.

```bash
nano .env
```

### 5. Start the Services

```bash
docker compose up -d
```

### 6. Check Running Containers

```bash
docker ps
```

## Service URLs

Replace `raspberrypi.local` with your Raspberry Pi IP address if needed.

| Service | URL |
|---|---|
| Pi-hole | `http://raspberrypi.local/admin` |
| Jellyfin | `http://raspberrypi.local:8096` |
| Portainer | `https://raspberrypi.local:9443` |
| Grafana | `http://raspberrypi.local:3000` |
| Prometheus | `http://raspberrypi.local:9090` |
| Nginx Proxy Manager | `http://raspberrypi.local:81` |

## Useful Commands

Start services:

```bash
docker compose up -d
```

Stop services:

```bash
docker compose down
```

View logs:

```bash
docker compose logs -f
```

Update containers:

```bash
bash scripts/update-containers.sh
```

Run health check:

```bash
bash scripts/healthcheck.sh
```

Run backup:

```bash
bash scripts/backup.sh
```

## Resume Bullet

Built and administered a self-hosted Raspberry Pi home server using Linux, Docker, and Docker Compose. Deployed containerized services including Pi-hole for DNS-based ad blocking, Jellyfin for media streaming, Portainer for container management, Grafana and Prometheus for monitoring, and Nginx Proxy Manager for reverse proxy configuration. Automated maintenance tasks with Bash scripts for backups, updates, and health checks.

## Screenshots to Add

Add screenshots to the `screenshots/` folder after setup:

- Pi-hole dashboard
- Jellyfin dashboard
- Portainer container list
- Grafana dashboard
- Nginx Proxy Manager dashboard

## Notes

Do not commit your real `.env` file, passwords, API keys, or private network information to GitHub.
