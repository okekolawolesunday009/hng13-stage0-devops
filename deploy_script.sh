#!/bin/bash

# This script will deploy a static website to a remote server

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure the web directory exists on the server
WEB_DIR="/var/www/html"

# Clear out the existing files in the web directory (optional step)
echo "Clearing the web directory..."
sudo rm -rf $WEB_DIR/*

# Copy the new files from the repository (wherever the HTML files are located)
echo "Deploying new files..."
scp -r * $WEB_DIR

# Restart NGINX (or the web server you're using) to reflect the changes
echo "Restarting NGINX..."
sudo systemctl restart nginx

echo "Deployment completed successfully!"
