ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV HASSIO-MICONNECTOR_VERSION=1.0.0
ENV ARCHIVE_HMC=miconnector-$HASSIO-MICONNECTOR_VERSION

ENV LGTV2MQTT_VERSION=1.0.3
ENV ARCHIVE=lgtv2mqtt-$LGTV2MQTT_VERSION

# Get latest version of the lgtv2mqtt app
RUN apt-get update -y
RUN apt-get install -y curl jq nodejs npm wget golang-go ccrypt
#RUN apk add --update --no-cache curl jq nodejs npm go wget build-base

# Get latest version of the lgtv2mqtt app
RUN curl -sSL https://github.com/miumida/lgtv2mqtt/tarball/master | tar -xvz --strip 1

# Install dependencies
#RUN npm install -g

RUN apt-get install -y build-essential apt-utils iputils-ping libudev-dev git
RUN apt-get install -y libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -

RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull
#RUN wget https://raw.githubusercontent.com/miumida/android_over_linux/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

#RUN dockerpull /opt/miconnector fison67/mi-connector-arm:latest

COPY run.sh "/$ARCHIVE/run.sh"
WORKDIR "/$ARCHIVE"

# Start app
RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
