ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV MICONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=miconnector-$MICONNECTOR4HASSIO_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get install -y curl jq golang-go wget npm

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/miconnector fison67/mi-connector-arm:latest

# miconnector copy
RUN mv /opt/miconnector/usr/src/app /home/miconnector \
    && rm -rf /opt/miconnector

# node 버전 의존성 처리
RUN apt-get install -y python3-setuptools
RUN easy_install3 nodeenv
RUN cd /home \
    && nodeenv --node=9.11.2 miconnector

# 의존성 package 설치
RUN apt-get install -y build-essential apt-utils iputils-ping git libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -

RUN apt-get install -y nodejs ccrypt

# config directory create
RUN mkdir /home/miconnector/config

COPY run.sh "/home/miconnector/run.sh"
WORKDIR "/home/miconnector"

# docker port open 30000
EXPOSE 30000

# Start app
RUN ["chmod", "a+x", "/home/miconnector/run.sh"]
CMD [ "/home/miconnector/run.sh" ]
