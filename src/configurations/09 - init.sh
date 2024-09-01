#!/bin/bash

# Otorgar permisos de ejecución a todos los scripts, del directorio actual ( relativo )
# chmod +x ./'10 - log.sh'
# chmod +x ./'11 - pgpass.sh'
# chmod +x ./'12 - backup.sh'
# chmod +x ./'13 - cron.sh'

# Crear el directorio de backups
# mkdir -p /opt/backups

# Crear el directorio de logs
# mkdir -p /opt/logs

# Crear el directorio de configurations
# mkdir -p /opt/configurations

# Nombre del archivo de log
# LOG_FILE="/opt/logs/init-$(date +"%Y-%m-%d").log"


# echo "" > "$LOG_FILE"
# Función para manejar errores y loguearlos
# handle_error() {
#   local error_message="$1"
#   echo "$(date): Error: $error_message" >> "$LOG_FILE"
# }

# # Ejecutar los scripts y manejar los errores
# main() {
#   # Inicializa o limpia el archivo de log
#   echo "" > "$LOG_FILE"

#   # Ejecuta los scripts y maneja los errores
#   {
#     # Script log.sh
#     /opt/configurations/log.sh || handle_error "Error en log.sh"

#     # Script pgpass.sh
#     /opt/configurations/pgpass.sh || handle_error "Error en pgpass.sh"

#     # Script backup.sh
#     /opt/configurations/backup.sh || handle_error "Error en backup.sh"

#     # Script cron.sh
#     /opt/configurations/cron.sh || handle_error "Error en cron.sh"

#   } || handle_error "Error general en la ejecución"

#   echo "Todos los scripts se han ejecutado correctamente"
# }

# # Llama a la función principal
# main
