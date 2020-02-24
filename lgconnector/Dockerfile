ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV LGCONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=lgconnector-$LGCONNECTOR4HASSIO_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get install -y curl jq golang-go wget npm

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/lgconnector fison67/lg-connector-rasp:0.0.3

# lgconnector copy
RUN mv /opt/lgconnector/usr/src/app /home/lgconnector
RUN rm -rf /opt/lgconnector
RUN cp /home/lgconnector/util/config.js /home/lgconnector/util/config_bak.js
RUN cp /home/lgconnector/util/log.js /home/lgconnector/util/log_bak.js

# 의존성 package 설치
RUN apt-get install -y build-essential apt-utils iputils-ping git libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash

RUN apt-get install -y nodejs

# config directory create
RUN mkdir /home/lgconnector/config

RUN rm -R /home/lgconnector/node_modules

COPY run.sh "/home/lgconnector/run.sh"
WORKDIR "/home/lgconnector"

RUN npm install

# docker port open 30020
EXPOSE 30020

# Start app
RUN ["chmod", "a+x", "/home/lgconnector/run.sh"]
CMD [ "/home/lgconnector/run.sh" ]
