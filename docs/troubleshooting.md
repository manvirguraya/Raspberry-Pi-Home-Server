# Troubleshooting

## Docker Permission Denied

If Docker says permission denied, reboot after installing Docker:

```bash
sudo reboot
```

Or temporarily run Docker with sudo:

```bash
sudo docker compose ps
```

## Missing .env File

Create it from the template:

```bash
cp .env.example .env
nano .env
```

## Scripts Will Not Run

Make scripts executable:

```bash
chmod +x scripts/*.sh
```

## Port Already In Use

Check what is using a port:

```bash
sudo lsof -i :80
sudo lsof -i :53
```

If port 80 conflicts, change this in `docker-compose.yml`:

```yaml
ports:
  - "8088:80"
```

Then access that service using port `8088` instead.

## Pi-hole DNS Does Not Work

Check that Pi-hole is running:

```bash
docker compose ps pihole
```

Check that port 53 is open:

```bash
sudo lsof -i :53
```

Make sure your router or device DNS points to the server IP.

## Grafana Has No Data

Check Prometheus targets:

```txt
http://SERVER-IP:9090/targets
```

The Prometheus, node-exporter, and cadvisor targets should be UP.

## Plex Cannot See Media

Make sure media files are inside `media/movies`, `media/tv`, or `media/music`, or that your external drive is mounted to one of those paths.

Check permissions:

```bash
ls -la media
```

## Reset Everything

Stop containers:

```bash
./scripts/stop-services.sh
```

Delete generated data if you want a clean reset:

```bash
rm -rf data
./scripts/setup.sh
./scripts/start-services.sh
```
