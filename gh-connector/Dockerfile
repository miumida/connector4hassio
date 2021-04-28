FROM fison67/gh-connector:0.0.5

WORKDIR /usr/src/app

RUN apt-get install jq -y

COPY run.sh "/usr/src/app/run.sh"

# docker port open 30010
EXPOSE 30010

# Start app
RUN ["chmod", "a+x", "/usr/src/app/run.sh"]
CMD [ "/usr/src/app/run.sh" ]
