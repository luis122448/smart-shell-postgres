#!/bin/bash

# Contenido del crontab
CRON_CONTENT="0 0 * * * /opt/configurations/backup.sh"  # Ajusta la ruta a tu script backup.sh

# Agregar al crontab
(crontab -l 2>/dev/null; echo "$CRON_CONTENT") | crontab -