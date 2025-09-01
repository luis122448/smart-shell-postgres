FROM postgres:latest

LABEL mantainer=luis122448
LABEL email=luis122448gmail

# Install cron
RUN apt-get update && apt-get install -y cron

COPY ./src/scripts/docker /docker-entrypoint-initdb.d
COPY ./resources /opt/resources
COPY ./src/scripts/other /opt/scripts/other

# Make the script executable
RUN chown -R postgres:postgres ./docker-entrypoint-initdb.d/*.sh

RUN mkdir -p /opt/data
RUN mkdir -p /opt/configurations
RUN mkdir -p /opt/logs
RUN mkdir -p /opt/backups

EXPOSE 5432