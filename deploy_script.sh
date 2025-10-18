#!/bin/bash

# This script will deploy a static website to a remote server

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure the web directory exists on the server
WEB_DIR="/var/www/html"

# Clear out the existing files in the web directory (optional step)
echo "Clearing the web directory..."
sudo rm -rf $WEB_DIR/*

# Copy the new files from the repos#!/bin/bash

# Variables
TARGET_DIR="/var/www/html"
NGINX_CONFIG_DIR="/etc/nginx/sites-available"
NGINX_ENABLED_DIR="/etc/nginx/sites-enabled"
CONFIG_NAME="hng13-stage0-devops"
INDEX_FILE="./index.html" # or the location of your index file
NGINX_CONFIG="./nginx_config" # path to your nginx config file

# Step 1: Copy the index.html file to the server's web root
echo "Copying index.html to $TARGET_DIR..."
sudo cp $INDEX_FILE $TARGET_DIR/

# Step 2: Copy the Nginx configuration file to the sites-available directory
echo "Copying Nginx config to $NGINX_CONFIG_DIR..."
sudo cp $NGINX_CONFIG $NGINX_CONFIG_DIR/$CONFIG_NAME

# Step 3: Create a symbolic link in the sites-enabled directory
echo "Creating symlink in $NGINX_ENABLED_DIR..."
sudo ln -s $NGINX_CONFIG_DIR/$CONFIG_NAME $NGINX_ENABLED_DIR/$CONFIG_NAME

# Step 4: Test the Nginx configuration for errors
echo "Testing Nginx configuration..."
sudo nginx -t

# Step 5: Reload Nginx to apply changes
echo "Reloading Nginx..."
sudo systemctl reload nginx

echo "Deployment and Nginx configuration completed successfully."
itory (wherever the HTML files are located)
echo "Deploying new files..."
scp -r * $WEB_DIR

# Restart NGINX (or the web server you're using) to reflect the changes
echo "Restarting NGINX..."
sudo systemctl restart nginx

echo "Deployment completed successfully!"
