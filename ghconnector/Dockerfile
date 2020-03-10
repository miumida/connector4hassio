FROM ubuntu:latest

# Add env
ENV LANG ko_KR.UTF-8
ENV GHCONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=ghconnector-$GHCONNECTOR4HASSIO_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get upgrade -y

#docker image download
RUN apt-get install -y curl jq golang-go wget npm

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/ghconnector fison67/gh-connector:0.0.2

# ghconnector copy
RUN mv /opt/ghconnector/usr/src/app /home/ghconnector
RUN rm -rf /opt/ghconnector
RUN cp /home/ghconnector/util/config.js /home/ghconnector/util/config_bak.js
RUN cp /home/ghconnector/util/log.js /home/ghconnector/util/log_bak.js


RUN apt-get install build-essential libudev-dev git gcc curl libavahi-compat-libdnssd-dev nano -y
RUN apt-get install libavahi-compat-libdnssd-dev -y

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs -y

RUN rm -rf /home/ghconnector/node_modules

COPY run.sh "/home/ghconnector/run.sh"
WORKDIR "/home/ghconnector"

RUN npm install

# docker volume setting
VOLUME ["/music1", "/share/ghconnector/music"]

# docker port open 30010
EXPOSE 30010

# Start app
RUN ["chmod", "a+x", "/home/ghconnector/run.sh"]
CMD [ "/home/ghconnector/run.sh" ]
