FROM fison67/mi-connector:0.0.7

WORKDIR /usr/src/app

COPY run.sh "/usr/src/app/run.sh"

# docker port open 30010
EXPOSE 30000

# Start app
RUN ["chmod", "a+x", "/usr/src/app/run.sh"]
CMD [ "/usr/src/app/run.sh" ]
