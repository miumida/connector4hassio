FROM fison67/gh-connector:0.0.4

WORKDIR /usr/src/app

COPY run.sh "/usr/src/app/run.sh"

RUN mkdir /config/ghconnector

#RUN sed '30s|config/gh-connector.log|config/ghconnector/gh-connector.log|' util/log.js > util/log.js

# docker port open 30010
EXPOSE 30010

# Start app
RUN ["chmod", "a+x", "/usr/src/app/run.sh"]
CMD [ "/usr/src/app/run.sh" ]
