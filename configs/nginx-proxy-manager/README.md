# Nginx Proxy Manager Notes

Nginx Proxy Manager is used to manage reverse proxy rules from a web dashboard.

Default local URL:

```txt
http://raspberrypi.local:81
```

Common uses:

- Create friendly local URLs for services
- Manage proxy hosts
- Add SSL certificates if exposing services securely
- Route traffic to internal Docker services

Example proxy host targets:

| Service | Internal Target |
|---|---|
| Jellyfin | `http://jellyfin:8096` |
| Grafana | `http://grafana:3000` |
| Prometheus | `http://prometheus:9090` |
| Portainer | `https://portainer:9443` |

Do not expose services publicly unless you understand port forwarding, firewalls, authentication, and HTTPS.
