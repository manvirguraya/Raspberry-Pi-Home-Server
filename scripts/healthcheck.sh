#!/bin/bash

echo "Checking Docker containers..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "Checking disk usage..."
df -h

echo ""
echo "Checking memory usage..."
free -h

echo ""
echo "Checking system uptime..."
uptime
