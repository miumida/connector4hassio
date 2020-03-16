FROM ubuntu:latest

ENV LANG ko_KR.UTF-8
ENV LGCONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=lgconnector-$LGCONNECTOR4HASSIO_VERSION

#ubuntu apt source.list copy
#RUN cp /etc/apt/sources.list /etc/apt/sources.list_kr
#COPY sources.list "/etc/apt/sources.list"

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y curl jq golang-go wget npm

# dockerpull create
RUN wget https://github.com/miumida/connector4hassio/blob/master/util/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/lgconnector fison67/lg-connector:0.0.3

# lgconnector copy
RUN mv /opt/lgconnector/usr/src/app /home/lgconnector
RUN rm -rf /opt/lgconnector
RUN cp /home/lgconnector/util/config.js /home/lgconnector/util/config_bak.js
RUN cp /home/lgconnector/util/log.js /home/lgconnector/util/log_bak.js

RUN apt-get install build-essential libudev-dev git gcc libavahi-compat-libdnssd-dev -y

RUN curl -sL https://deb.nodesource.com/setup_10.x -o /home/lgconnector/nodesource_setup.sh
RUN apt-get install nodejs -y

RUN rm -R /home/lgconnector/node_modules

COPY run.sh "/home/lgconnector/run.sh"
WORKDIR "/home/lgconnector"

RUN npm install

# docker port open 30020
EXPOSE 30020

# Start app
RUN ["chmod", "a+x", "/home/lgconnector/run.sh"]
CMD [ "/home/lgconnector/run.sh" ]
