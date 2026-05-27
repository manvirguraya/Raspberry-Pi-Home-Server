# Network Setup

## Find Your Server IP

Run this on the server:

```bash
hostname -I
```

Use the first local IP address shown, usually something like:

```txt
192.168.1.50
```

## Use Pi-hole for Network-Wide DNS

Pi-hole works as a DNS server. To make all devices use it:

1. Open your router admin page.
2. Find LAN, DHCP, or DNS settings.
3. Set the DNS server to your home server IP.
4. Save and reboot devices or renew DHCP leases.

Example:

```txt
DNS Server: 192.168.1.50
```

If your router does not support custom DNS, set DNS manually on each device.

## Recommended Local IP Setup

For reliability, give the server a fixed IP address. The easiest method is usually a DHCP reservation in your router.

Example:

```txt
Home Server: 192.168.1.50
```

## Port Notes

This stack uses these common ports:

| Service | Port |
|---|---|
| Pi-hole DNS | 53 |
| Pi-hole Web UI | 8080 |
| Plex | 32400 |
| Grafana | 3000 |
| Prometheus | 9090 |
| Node Exporter | 9100 |
| cAdvisor | 8081 |
| Portainer | 9443 |
| Nginx Proxy Manager HTTP | 80 |
| Nginx Proxy Manager Admin | 81 |
| Nginx Proxy Manager HTTPS | 443 |

If another service already uses one of these ports, change the left side of the port mapping in `docker-compose.yml`.
