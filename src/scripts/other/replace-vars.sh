#!/bin/bash

# Path to the directory where SQL scripts are located
SCRIPTS_DIR="/docker-entrypoint-initdb.d"

# Replace variables in SQL files
for file in $SCRIPTS_DIR/*.sql; do
  if [[ -f "$file" ]]; then
    echo "Replacing variables in $file"
    sed -i "s/\${POSTGRES_DB}/$POSTGRES_DB/g" "$file"
  fi
done
