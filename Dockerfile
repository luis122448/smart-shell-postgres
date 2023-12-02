FROM postgres
LABEL luis122448 <luis122448gmail.com>

WORKDIR /opt

# Instalación de cron
RUN apt-get update && apt-get install -y cron

COPY ./init-scripts /opt/docker-entrypoint-initdb.d

COPY ./configurations /opt/configurations

RUN chmod +x /opt/configurations/*.sh

RUN /bin/bash -c "/opt/configurations/log.sh"
RUN /bin/bash -c "/opt/configurations/pgpass.sh"
RUN /bin/bash -c "/opt/configurations/cron.sh"

EXPOSE 5432