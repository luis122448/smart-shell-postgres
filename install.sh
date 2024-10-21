#!/bin/bash

# Create environment variables file
touch .env

# Delete directories
rm -rf /var/www/volumes/smart-shell/smart-shell-postgres/data
rm -rf /var/www/volumes/smart-shell/smart-shell-postgres/logs
rm -rf /var/www/volumes/smart-shell/smart-shell-postgres/backups
rm -rf /var/www/volumes/smart-shell/smart-shell-postgres/configurations

# Create directories
mkdir -p /var/www/volumes/smart-shell/smart-shell-postgres/data
mkdir -p /var/www/volumes/smart-shell/smart-shell-postgres/logs
mkdir -p /var/www/volumes/smart-shell/smart-shell-postgres/backups
mkdir -p /var/www/volumes/smart-shell/smart-shell-postgres/configurations