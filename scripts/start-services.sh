#!/bin/bash

echo "Starting Docker services..."
docker compose up -d

echo "Services started."
docker ps