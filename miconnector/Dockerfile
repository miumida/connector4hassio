ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

ENV LGTV2MQTT_VERSION=1.0.3
ENV ARCHIVE=lgtv2mqtt-$LGTV2MQTT_VERSION

# Get latest version of the lgtv2mqtt app
RUN apk add --update --no-cache curl jq nodejs npm go wget
#  npm install -g lgtv2mqtt

RUN wget https://github.com/djjproject/android_over_linux/raw/master/aolothercommand/download-docker-image-rootfs.sh -O /usr/local/bin/dockerpull
RUN ["chmod", "a+x", "/usr/local/bin/dockerpull"]


# Get latest version of the lgtv2mqtt app
# --strip 1 removes the container folder
RUN curl -sSL https://github.com/miumida/lgtv2mqtt/tarball/master | tar -xvz --strip 1

# Install dependencies
RUN npm install -g

COPY run.sh "/$ARCHIVE/run.sh"
WORKDIR "/$ARCHIVE"

RUN ["chmod", "a+x", "./run.sh"]
CMD [ "./run.sh" ]
# Start app
#CMD node index.js --verbosity=$lgtv2mqtt_v --name=$lgtv2mqtt_n --url=$lgtv2mqtt_u --tv=$lgtv2mqtt_t
