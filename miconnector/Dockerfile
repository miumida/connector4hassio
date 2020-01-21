ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

ENV LGTV2MQTT_VERSION=1.0.3
ENV ARCHIVE=lgtv2mqtt-$LGTV2MQTT_VERSION

# Get latest version of the lgtv2mqtt app
RUN apk add --update --no-cache curl jq nodejs npm go wget

#RUN apt-get install -y build-essential apt-utils iputils-ping libudev-dev git
#RUN apt-get install -y libcairo2-dev libgif-dev libjpeg-dev libgif7 libpango1.0-dev

#RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -

#RUN apt-get install nodejs -y
#RUN apt-get install ccrypt -y


RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull

RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]

RUN dockerpull /opt/miconnector fison67/mi-connector-arm:latest


# Install dependencies
RUN npm install -g

COPY run.sh "/$ARCHIVE/run.sh"
WORKDIR "/$ARCHIVE"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
# Start app
#CMD node index.js --verbosity=$lgtv2mqtt_v --name=$lgtv2mqtt_n --url=$lgtv2mqtt_u --tv=$lgtv2mqtt_t
