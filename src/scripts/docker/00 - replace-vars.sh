#!/bin/bash

# Check if POSTGRES_DB is set
if [ -z "$POSTGRES_DB" ]; then
  echo "POSTGRES_DB variable is not set!"
  exit 1
fi

if [ -z "$POSTGRES_PASSWORD" ]; then
  echo "POSTGRES_PASSWORD variable is not set!"
  exit 1
fi

# Path to the directory where SQL scripts are located
SCRIPTS_DIR="/docker-entrypoint-initdb.d"

# Replace variables in SQL files
for file in $SCRIPTS_DIR/*.sql; do
  if [[ -f "$file" ]]; then
    echo "Replacing variables in $file"
    sed -i "s/\${POSTGRES_DB}/$POSTGRES_DB/g" "$file"
    sed -i "s/\${POSTGRES_PASSWORD}/$POSTGRES_PASSWORD/g" "$file"
  fi
done
