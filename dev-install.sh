#!/bin/bash
# Export environment variable
{
    export LOCAL_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
} || { 
    export LOCAL_HOST="127.0.0.1"
}

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