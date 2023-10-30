FROM openjdk:8

USER root

ENV SEATUNNEL_WEB_HOME /opt/seatunnel-web
ENV HOSTNAME="localhost"
ENV PORT="3306"
ENV USERNAME="root"
ENV PASSWORD="123456"

RUN wget https://github.com/apache/seatunnel-web/archive/refs/tags/1.0.0.tar.gz -O seatunnel-web-1.0.0.tar.gz
RUN tar -xzvf seatunnel-web-1.0.0.tar.gz
RUN mv seatunnel-web-1.0.0 ${SEATUNNEL_WEB_HOME}

WORKDIR $SEATUNNEL_WEB_HOME

EXPOSE 8080

CMD [ "bash", "${SEATUNNEL_WEB_HOME}/seatunnel-server/seatunnel-app/src/main/resources/script/init_sql.sh" ]