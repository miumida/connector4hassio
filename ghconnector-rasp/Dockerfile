ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV GHCONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=ghconnector-$GHCONNECTOR4HASSIO_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get upgrade -y

#gcc 5.x Install
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update

RUN apt-get install -y gcc-5

RUN apt-get install -y curl jq golang-go wget npm

# dockerpull create
RUN wget https://github.com/miumida/connector4hassio/blob/master/util/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/ghconnector fison67/gh-connector-rasp:0.0.2

# ghconnector copy
RUN mv /opt/ghconnector/usr/src/app /home/ghconnector
RUN rm -rf /opt/ghconnector
RUN cp /home/ghconnector/util/config.js /home/ghconnector/util/config_bak.js
RUN cp /home/ghconnector/util/log.js /home/ghconnector/util/log_bak.js

# 의존성 package 설치
RUN apt-get install -y build-essential apt-utils iputils-ping libcairo2-dev libgif-dev libjpeg-dev libgif7 libavahi-compat-libdnssd-dev

#RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

RUN apt-get install nodejs -y

RUN rm -rf /home/ghconnector/node_modules

COPY run.sh "/home/ghconnector/run.sh"
WORKDIR "/home/ghconnector"

RUN npm install

# docker port open 30010
EXPOSE 30010

# Start app
RUN ["chmod", "a+x", "/home/ghconnector/run.sh"]
CMD [ "/home/ghconnector/run.sh" ]
