FROM openjdk:8

USER root

ENV SEATUNNEL_WEB_HOME /opt/seatunnel-web
ENV PROJECT_VERSION 1.0.0

RUN wget https://github.com/apache/seatunnel-web/archive/refs/tags/1.0.0.tar.gz -O seatunnel-web-1.0.0.tar.gz
RUN tar -xzvf seatunnel-web-1.0.0.tar.gz
RUN mv seatunnel-web-1.0.0 ${SEATUNNEL_WEB_HOME}

WORKDIR $SEATUNNEL_WEB_HOME

RUN ./mvnw spotless:apply
RUN bash build.sh code

ENV SEATUNNEL_WEB_HOME seatunnel-web-dist/target/apache-seatunnel-web-${PROJECT_VERSION}/apache-seatunnel-web-${PROJECT_VERSION}

WORKDIR $SEATUNNEL_WEB_HOME

EXPOSE 8801

ENV SEATUNNEL_HOME /opt/seatunnel

ADD ./start.sh ./bin/start.sh
ADD ./hazelcast-client.yaml ./conf/hazelcast-client.yaml
ADD ./plugin-mapping.properties ./conf/plugin-mapping.properties

CMD [ "/bin/bash", "bin/start.sh", "start" ]