FROM fison67/lg-connector:0.0.5

WORKDIR /usr/src/app

COPY run.sh "/usr/src/app/run.sh"

# docker port open 30020
EXPOSE 30020

# Start app
RUN ["chmod", "a+x", "/usr/src/app/run.sh"]
CMD [ "/usr/src/app/run.sh" ]
