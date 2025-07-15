#!/bin/bash
set -e

echo "[+] Deploying using current repo contents..."

cd flask-stack

echo "[+] Starting Docker Compose stack..."
docker compose pull
docker compose up -d

echo "[✓] App deployed!"
