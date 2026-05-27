# Troubleshooting

## Check Docker Status

```bash
systemctl status docker
```

## Check Running Containers

```bash
docker ps
```

## View Container Logs

```bash
docker compose logs -f
```

## Restart Services

```bash
docker compose restart
```

## Restart One Service

```bash
docker compose restart pihole
```

## Stop All Services

```bash
docker compose down
```

## Start All Services

```bash
docker compose up -d
```

## Pi-hole Web Interface Conflict

This setup maps Pi-hole to port `8080` instead of port `80` because Nginx Proxy Manager uses port `80`.

Pi-hole URL:

```txt
http://raspberrypi.local:8080/admin
```

## Grafana Login

The Grafana username and password are set inside the `.env` file.

## Permission Issues

If Docker commands require sudo, add your user to the Docker group:

```bash
sudo usermod -aG docker $USER
```

Then log out and back in.
