#!/bin/bash

# Directorio de respaldo
backup_dir="/opt/backups"

# Nombre del archivo de respaldo
backup_file="backup-$(date +%Y%m%d_%H%M%S).sql"

# Comando para realizar la copia de seguridad utilizando pg_dump
PGPASSFILE=~/.pgpass pg_dump -h localhost -U postgres smart-shell > "$backup_dir/$backup_file"