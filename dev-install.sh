# Variables de entorno
{
    export LOCAL_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
} || { 
    export LOCAL_HOST="127.0.0.1"
}

# Creando archivo de variables de entorno
touch .env

# Crenado directorio el registro de logs
mkdir -p logs

# Creando directorio de backups
mkdir -p backups

# Otorando permisos de ejecucion a los scripts
ip[]