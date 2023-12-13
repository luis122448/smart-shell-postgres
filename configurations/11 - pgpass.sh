#!/bin/bash

# Obtener la dirección IP de docker0
HOST="172.17.0.1"
PORT=5432

# Directorio del archivo .pgpass
PGPASS_FILE="/opt/configurations/.pgpass"

# Verificar si el archivo .pgpass existe; si no, crearlo con permisos seguros
if [ ! -f "$PGPASS_FILE" ]; then
    touch "$PGPASS_FILE"
    chmod 600 "$PGPASS_FILE"
fi

# Escribir o actualizar la línea en el archivo .pgpass con las variables de entorno
echo "$HOST:$PORT:$POSTGRES_DB:$POSTGRES_USER:$POSTGRES_PASSWORD" >> "$PGPASS_FILE"

# Asegurarse de que el archivo .pgpass tenga los permisos adecuados
chmod 600 "$PGPASS_FILE"