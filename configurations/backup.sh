#!/bin/bash

# Crear el directorio de backups
mkdir -p /opt/backups

# Directorio de respaldo
backup_dir="/opt/backups"

# Nombre del archivo de respaldo
backup_file="backup-$(date +%Y%m%d_%H%M%S).sql"

# Comando para realizar la copia de seguridad utilizando pg_dump
{
    PGPASSFILE="/opt/configurations/.pgpass" pg_dump --no-password -h 172.17.0.1 -U postgres smart-shell > "$backup_dir/$backup_file"
} || { 
    echo "$(date): Error en la copia de seguridad utilizando pg_dump" >> /opt/logs/init-$(date +"%Y-%m-%d").log
}
