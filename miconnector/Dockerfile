ARG BUILD_FROM
FROM resin/rpi-raspbian:latest

# Add env
ENV LANG C.UTF-8

ENV HASSIO-MICONNECTOR_VERSION=1.0.0
ENV ARCHIVE=miconnector-$HASSIO-MICONNECTOR_VERSION

# apt-get Update & Install
RUN apt-get update -y
RUN apt-get install -y curl jq nodejs npm wget golang-go ccrypt

RUN apt-get install -y build-essential apt-utils iputils-ping libudev-dev git
RUN apt-get install -y libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -

# dockerpull create
RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

#RUN dockerpull /opt/miconnector fison67/mi-connector-arm:latest

COPY run.sh "/$ARCHIVE/run.sh"
WORKDIR "/home/miconnector/usr/src/app"

# Start app
RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
