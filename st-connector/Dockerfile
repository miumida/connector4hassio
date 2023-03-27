FROM fison67/st-connector:0.0.3

WORKDIR /usr/src/app

RUN apt-get install jq -y

#COPY run.sh "/usr/src/app/run.sh"

# docker port open 4000
EXPOSE 4000

# Start app
#RUN ["chmod", "a+x", "/usr/src/app/run.sh"]
#CMD [ "/usr/src/app/run.sh" ]
CMD [ "npm", "start" ]
