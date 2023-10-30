FROM node:16.11.1

USER root

ENV SEATUNNEL_WEB_HOME /opt/seatunnel-web

RUN wget https://github.com/apache/seatunnel-web/archive/refs/tags/1.0.0.tar.gz -O seatunnel-web-1.0.0.tar.gz
RUN tar -xzvf seatunnel-web-1.0.0.tar.gz
RUN mv seatunnel-web-1.0.0 ${SEATUNNEL_WEB_HOME}

WORKDIR $SEATUNNEL_WEB_HOME/seatunnel-ui

EXPOSE 5173

RUN npm install

CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0" ]