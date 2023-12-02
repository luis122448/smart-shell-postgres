FROM postgres
LABEL luis122448 <luis122448gmail.com>

WORKDIR /opt

# Instalación de cron
RUN apt-get update && apt-get install -y cron

COPY ./init-scripts /opt/docker-entrypoint-initdb.d
COPY ./configurations /opt/docker-entrypoint-initdb.ds
COPY ./configurations /opt/configurations

RUN chmod +x /opt/configurations/*.sh

EXPOSE 5432