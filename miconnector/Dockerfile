ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV HASSIO_MICONNECTOR_VERSION=1.0.0
ENV ARCHIVE=miconnector-$HASSIO_MICONNECTOR_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get install -y curl jq nodejs npm wget golang-go ccrypt

RUN apt-get install -y build-essential apt-utils iputils-ping libudev-dev git
RUN apt-get install -y libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -

#RUN curl -sSL https://github.com/miumida/lgtv2mqtt/tarball/master | tar -xvz --strip 1

# Install dependencies
#RUN npm install -g

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /home/miconnector fison67/mi-connector-arm:latest

COPY run.sh "/home/miconnector/usr/src/app/run.sh"
WORKDIR "/home/miconnector/usr/src/app"

# Start app
RUN ["chmod", "a+x", "/home/miconnector/usr/src/app/run.sh"]
CMD [ "/home/miconnector/usr/src/app/run.sh" ]
