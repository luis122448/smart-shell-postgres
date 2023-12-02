#!/bin/bash

# Directorio del archivo .pgpass
PGPASS_FILE=~/.pgpass

# Variables para configurar
HOST=localhost
PORT=5432

# Verificar si el archivo .pgpass existe; si no, crearlo con permisos seguros
if [ ! -f "$PGPASS_FILE" ]; then
    touch "$PGPASS_FILE"
    chmod 600 "$PGPASS_FILE"
fi

# Escribir o actualizar la línea en el archivo .pgpass
echo "$HOST:$PORT:$POSTGRES_DB:$POSTGRES_USER:$POSTGRES_PASSWORD" >> "$PGPASS_FILE"

# Asegurarse de que el archivo .pgpass tenga los permisos adecuados
chmod 600 "$PGPASS_FILE"