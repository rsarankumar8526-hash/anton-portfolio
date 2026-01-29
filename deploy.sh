#!/bin/bash
# Anton's Local Deployment Script

set -e

APP_DIR="/home/saran/apps/anton-portfolio"
WEB_DIR="/var/www/anton-portfolio"

echo "🚀 Starting deployment for Anton Portfolio..."

cd $APP_DIR

# Pull latest changes
echo "📥 Pulling latest changes from GitHub..."
git pull origin master

# Install and build
echo "🏗️ Building application..."
npm install
npm run build

# Move to web directory
echo "📦 Moving assets to $WEB_DIR..."
sudo rm -rf $WEB_DIR/*
sudo cp -r $APP_DIR/dist/* $WEB_DIR/
sudo chown -R saran:saran $WEB_DIR

# Reload Caddy (if config changed, but usually not needed for static files)
# sudo systemctl reload caddy

echo "✅ Deployment complete! Live at https://anton.sarancodes.in"
