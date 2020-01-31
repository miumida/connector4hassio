ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV HASSIO_MICONNECTOR_VERSION=1.0.0
ENV ARCHIVE=miconnector-$HASSIO_MICONNECTOR_VERSION

# apt-get Update & Install
RUN apt-get update -y
#RUN apt-get install -y wget npm
RUN apt-get install -y curl jq golang-go wget npm

# easy_install 사용을 위함
RUN apt-get install -y python3-setuptools
RUN easy_install3 nodeenv

# dockerpull create
#RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

#RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

#RUN dockerpull /opt/miconnector fison67/mi-connector-arm:latest

# miconnector copy
#RUN mv /opt/miconnector/usr/src/app /home/miconnector

# docker image 삭제
#RUN rm -rf /opt/miconnector

# 의존성 package 설치
#RUN apt-get install -y build-essential apt-utils iputils-ping libudev-dev git
#RUN apt-get install -y libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

#RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -

#RUN apt-get install -y nodejs
#RUN apt-get install -y ccrypt

#RUN mkdir /config

# miconnector download
RUN wget http://u5pvr.djjproject.com/miconnector.tar

RUN tar xf miconnector.tar 

RUN mv app/ /home/miconnector/

# miconnector.tar file delete
RUN rm -rf miconnector.tar 

# 의존성 package 설치
RUN apt-get install -y build-essential apt-utils iputils-ping git libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash

RUN apt-get install -y nodejs ccrypt

# config directory create
RUN mkdir /home/miconnector/config

COPY run.sh "/home/miconnector/run.sh"
WORKDIR "/home/miconnector"

EXPOSE 30000

# Start app
RUN ["chmod", "a+x", "/home/miconnector/run.sh"]
CMD [ "/home/miconnector/run.sh" ]
