ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV GHCONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=ghconnector-$GHCONNECTOR4HASSIO_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get install -y curl jq golang-go wget npm

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/ghconnector fison67/gh-connector-rasp:0.0.2

# ghconnector copy
RUN mv /opt/ghconnector/usr/src/app /home/ghconnector
RUN rm -rf /opt/ghconnector
RUN cp /home/ghconnector/util/config.js /home/ghconnector/util/config_bak.js

# 의존성 package 설치
RUN apt-get install -y build-essential apt-utils iputils-ping git libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo bash

RUN apt-get install -y nodejs ccrypt

# config directory create
RUN mkdir /home/ghconnector/config

RUN rm -R /home/ghconnector/node_modules

COPY run.sh "/home/ghconnector/run.sh"
WORKDIR "/home/ghconnector"

RUN npm install

# docker port open 30010
EXPOSE 30010

# Start app
RUN ["chmod", "a+x", "/home/ghconnector/run.sh"]
CMD [ "/home/ghconnector/run.sh" ]
