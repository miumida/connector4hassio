FROM ubuntu:18.10

ENV LANG ko_KR.UTF-8

RUN cp /etc/apt/sources.list /etc/apt/sources.list_kr
COPY sources.list "/etc/apt/sources.list"

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install build-essential libudev-dev git gcc curl libavahi-compat-libdnssd-dev -y

RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN apt-get install nodejs npm -y

RUN cd /usr/src/app

# Bundle app sources
COPY . .
RUN mkdir /config

COPY bin /usr/src/app/bin
COPY lg-config.json /config

RUN npm install


CMD npm start
