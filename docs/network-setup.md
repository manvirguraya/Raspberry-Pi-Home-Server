# Network Setup

## Recommended Setup

1. Connect the Raspberry Pi to your router using Ethernet.
2. Give the Raspberry Pi a static IP address in your router settings.
3. Set your router's DNS server to the Raspberry Pi IP address so devices use Pi-hole.
4. Use SSH to manage the Pi from your main computer.

## Example Network Layout

```txt
Internet
   |
Router
   |
Raspberry Pi Static IP: 192.168.1.50
   |
Docker Services
```

## DNS Setup

To use Pi-hole across the whole network, set your router DNS server to your Raspberry Pi IP address.

Example:

```txt
Primary DNS: 192.168.1.50
Secondary DNS: optional backup DNS
```

## SSH Into the Pi

```bash
ssh pi@raspberrypi.local
```

Or use the Pi IP address:

```bash
ssh pi@192.168.1.50
```
