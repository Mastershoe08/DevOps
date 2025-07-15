#!/bin/bash
set -e

APP_DIR="/home/tester/app"
REPO_URL="https://github.com/Mastershoe08/DevOps"

echo "[+] Deploying to $APP_DIR"

if [ -d "$APP_DIR" ]; then
  echo "[+] Pulling latest changes..."
  cd "$APP_DIR"
  git pull
else
  echo "[+] Cloning repo..."
  git clone "$REPO_URL" "$APP_DIR"
  cd "$APP_DIR"
fi

echo "[+] Starting Docker Compose stack..."
docker compose pull
docker compose up -d

echo "[✓] App deployed!"
