#!/bin/bash
set -e

cd /app/appTesi

echo "Updating code from GitHub..."
git reset --hard
git pull || true

echo "Installing/Updating dependencies..."
pip install --no-cache-dir -r requirements.txt

echo "Starting Gunicorn..."
exec gunicorn -w 4 -b 0.0.0.0:8000 app:app