ARG BUILD_FROM
FROM ubuntu:latest

# Add env
ENV LANG C.UTF-8

ENV MICONNECTOR4HASSIO_VERSION=1.0.0
ENV ARCHIVE=miconnector-$MICONNECTOR4HASSIO_VERSION

RUN apt-get update -y
RUN apt-get install -y jq golang-go wget npm

RUN apt-get install -y build-essential libudev-dev git gcc curl nano
RUN apt-get install -y --no-install-recommends ffmpeg
RUN apt-get install -y libcairo2-dev libgif-dev libjpeg-dev iputils-ping

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/miconnector fison67/mi-connector:latest

# miconnector copy
RUN mv /opt/miconnector/usr/src/app /home/miconnector && rm -rf /opt/miconnector
RUN cp /home/miconnector/util/config.js /home/miconnector/util/config_bak.js

RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN apt-get install -y nodejs ccrypt

# delete temp file
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

RUN rm -R /home/miconnector/node_modules

COPY run.sh "/home/miconnector/run.sh"
WORKDIR "/home/miconnector"

RUN npm install

# docker port open 30000
EXPOSE 30000

# Start app
RUN ["chmod", "a+x", "/home/miconnector/run.sh"]
CMD [ "/home/miconnector/run.sh" ]
