#!/bin/bash
set -e

# Use a writable, safe directory for CI or local use
APP_DIR="./app"  # Relative path to keep it simple
REPO_URL="https://github.com/Mastershoe08/DevOps"

echo "[+] Deploying to $APP_DIR"

if [ -d "$APP_DIR/.git" ]; then
  echo "[+] Pulling latest changes..."
  git -C "$APP_DIR" pull
else
  echo "[+] Cloning repo..."
  git clone "$REPO_URL" "$APP_DIR"
fi

cd "$APP_DIR/flask-stack"

echo "[+] Starting Docker Compose stack..."
docker compose pull
docker compose up -d

echo "[✓] App deployed!"
echo "this is dumb"