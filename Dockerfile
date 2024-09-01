FROM postgres
LABEL luis122448 <luis122448gmail.com>

# Install cron
RUN apt-get update && apt-get install -y cron

COPY ./src/scripts/docker ./docker-entrypoint-initdb.d
COPY ./resources /opt/resources
COPY ./src/scripts/other /opt/scripts/other

# Make the script executable
RUN chmod +x /opt/scripts/other/replace-vars.sh
# RUN chown -R postgres:postgres ./docker-entrypoint-initdb.d/*.sh

RUN mkdir -p /opt/data
RUN mkdir -p /opt/configurations
RUN mkdir -p /opt/logs
RUN mkdir -p /opt/backups

# Run the variable replacement script
RUN /opt/scripts/other/replace-vars.sh

EXPOSE 5432