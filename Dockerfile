FROM postgres
LABEL luis122448 <luis122448gmail.com>

# Instalación de cron
RUN apt-get update && apt-get install -y cron

COPY ./init-scripts ./docker-entrypoint-initdb.d
# COPY ./configurations ./docker-entrypoint-initdb.d

# RUN chown -R postgres:postgres ./docker-entrypoint-initdb.d/*.sh

RUN mkdir -p /opt/configurations
RUN mkdir -p /opt/logs
RUN mkdir -p /opt/backups

EXPOSE 5432