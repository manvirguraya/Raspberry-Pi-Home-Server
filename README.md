# Self-Hosted Home Server

A self-hosted Linux home server that runs network, media, monitoring, and management services using Docker. This project can run on a Raspberry Pi, leftover laptop, mini PC, desktop, or Linux virtual machine.

The stack includes Pi-hole for DNS ad blocking, Plex Media Server for personal media streaming, Portainer for container management, Prometheus and Grafana for monitoring, cAdvisor and Node Exporter for metrics, and Nginx Proxy Manager for reverse proxy management.

## Project Description

This project demonstrates how unused hardware can be repurposed into a small home server. Docker Compose runs each service in its own container, making the setup easier to deploy, update, monitor, and back up.

## Features

- Network-wide ad blocking with Pi-hole
- Personal media streaming with Plex Media Server
- Docker container management with Portainer
- System and container monitoring with Prometheus, Grafana, Node Exporter, and cAdvisor
- Reverse proxy management with Nginx Proxy Manager
- Automated setup, updates, backups, and health checks using Bash scripts
- Environment variable template using `.env.example`
- Persistent service data stored under `data/`

## Technologies Used

- Linux / Raspberry Pi OS / Ubuntu Server
- Docker
- Docker Compose
- Bash
- YAML
- Pi-hole
- Plex
- Portainer
- Prometheus
- Grafana
- Node Exporter
- cAdvisor
- Nginx Proxy Manager

## Architecture

```txt
Internet
   |
Router
   |
Home Server
   |-- Pi-hole DNS Ad Blocking
   |-- Plex Media Server
   |-- Portainer Docker Management
   |-- Prometheus Metrics Collection
   |-- Grafana Monitoring Dashboard
   |-- Node Exporter Host Metrics
   |-- cAdvisor Container Metrics
   |-- Nginx Proxy Manager Reverse Proxy
```

## Repository Structure

```txt
self-hosted-home-server/
|
|-- README.md
|-- docker-compose.yml
|-- .env
|-- .gitignore
|
|-- configs/
|   |-- prometheus/
|   |   |-- prometheus.yml
|   |
|   |-- grafana/
|   |   |-- provisioning/
|   |   |   |-- datasources/
|   |   |   |   |-- prometheus.yml
|   |   |   |-- dashboards/
|   |   |       |-- dashboards.yml
|   |   |-- dashboards/
|   |       |-- home-server-overview.json
|   |
|   |-- nginx-proxy-manager/
|       |-- README.md
|
|-- docs/
|   |-- network-setup.md
|   |-- troubleshooting.md
|
|-- scripts/
|   |-- install-docker.sh
|   |-- setup.sh
|   |-- start-services.sh
|   |-- stop-services.sh
|   |-- update-containers.sh
|   |-- backup.sh
|   |-- healthcheck.sh
|
|-- screenshots/
|   |-- .gitkeep
```

## Setup Instructions

### 1. Prepare the Server

Install a Linux-based OS on your Raspberry Pi, old laptop, mini PC, desktop, or VM.

Recommended options:

- Raspberry Pi OS 64-bit
- Ubuntu Server
- Debian
- Ubuntu Desktop if you want a GUI

Make sure the device has internet access.

### 2. Install Git

```bash
sudo apt update
sudo apt install git -y
```

### 3. Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/self-hosted-home-server.git
cd self-hosted-home-server
```

### 4. Install Docker

```bash
chmod +x scripts/*.sh
./scripts/install-docker.sh
```

After Docker installs, log out and back in or reboot:

```bash
sudo reboot
```

Then return to the project folder.

### 5. Run Project Setup

```bash
./scripts/setup.sh
```

This script creates required folders, copies `.env.example` to `.env` if needed, makes scripts executable, and validates the Docker Compose file.

### 6. Edit Environment Variables

```bash
nano .env
```

Change the default passwords before starting services.

Example:

```env
TZ=America/Chicago
PUID=1000
PGID=1000
PLEX_CLAIM=
PIHOLE_WEBPASSWORD=change_this_password
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=change_this_password
```

### 7. Start the Services

```bash
./scripts/start-services.sh
```

This runs:

```bash
docker compose up -d
```

Docker will download and start all containers.

### 8. Check Running Containers

```bash
docker compose ps
```

Or run:

```bash
./scripts/healthcheck.sh
```

## Service URLs

Replace `SERVER-IP` with your device's local IP address.

| Service | URL |
|---|---|
| Pi-hole | `http://SERVER-IP:8080/admin` |
| Plex | `http://SERVER-IP:32400/web` |
| Portainer | `https://SERVER-IP:9443` |
| Grafana | `http://SERVER-IP:3000` |
| Prometheus | `http://SERVER-IP:9090` |
| cAdvisor | `http://SERVER-IP:8081` |
| Nginx Proxy Manager | `http://SERVER-IP:81` |

## Default Logins

### Grafana

Username and password come from your `.env` file:

```env
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=change_this_password
```

### Pi-hole

The admin password comes from:

```env
PIHOLE_WEBPASSWORD=change_this_password
```

### Nginx Proxy Manager

Nginx Proxy Manager creates its own first-login credentials. After logging in, change the default account immediately.


## Plex First-Time Setup

Plex uses your personal Plex account to claim and manage the server. During first setup, open:

```txt
http://SERVER-IP:32400/web
```

You can optionally add a temporary claim token in `.env` using `PLEX_CLAIM`. Claim tokens can be generated from Plex and expire quickly, so leaving it blank is okay if you claim the server through the browser setup.

For file permissions, `PUID` and `PGID` in `.env` should usually match your Linux user. You can check them with:

```bash
id
```

## Useful Commands

Start services:

```bash
./scripts/start-services.sh
```

Stop services:

```bash
./scripts/stop-services.sh
```

View logs:

```bash
docker compose logs -f
```

Update containers:

```bash
./scripts/update-containers.sh
```

Run health check:

```bash
./scripts/healthcheck.sh
```

Run backup:

```bash
./scripts/backup.sh
```

## Pi-hole Network Setup

Pi-hole will run after `docker compose up -d`, but network-wide ad blocking requires one extra network step.

Set your router's DNS server to your home server's local IP address. If your router does not allow custom DNS, manually set DNS on each device to the server IP.

Example:

```txt
Router DNS Server: 192.168.1.50
```

The exact router menu varies by manufacturer.

## Plex Media Setup

Place your own personal media files in the local `media/` folder or mount an external drive to that path. Do not upload media files to GitHub.

Example:

```txt
media/
|-- movies/
|-- shows/
|-- music/
```

Plex reads these folders inside the container as:

```txt
/movies
/tv
/music
```

When creating Plex libraries, choose `/movies`, `/tv`, or `/music` as the library path.

## Grafana Monitoring Setup

Grafana is automatically provisioned with Prometheus as a data source and a starter dashboard named `Home Server Overview`.

Prometheus collects metrics from:

- Prometheus itself
- Node Exporter for host system metrics
- cAdvisor for Docker container metrics

## What Is Not Automated

This repository automates the Docker-based home server stack, but it does not automate:

- Flashing Raspberry Pi OS
- Router DNS configuration
- Domain name registration
- SSL certificate setup in Nginx Proxy Manager
- Adding personal media files

Those steps depend on your hardware, router, and network.