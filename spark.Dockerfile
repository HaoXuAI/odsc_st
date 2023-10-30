FROM apache/spark:3.3.3-scala2.12-java11-ubuntu

USER root

ENV SEATUNNEL_VERSION="2.3.3"
ENV SEATUNNEL_HOME="/opt/seatunnel"

RUN wget https://dlcdn.apache.org/seatunnel/${SEATUNNEL_VERSION}/apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz
RUN tar -xzvf apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz
RUN mv apache-seatunnel-${SEATUNNEL_VERSION} ${SEATUNNEL_HOME}

WORKDIR ${SEATUNNEL_HOME}

RUN mkdir -p ./pluggins/jdbc/lib
ADD ./snowflake-jdbc-3.13.29.jar ./pluggins/jdbc/lib/

RUN bin/install-plugin.sh ${SEATUNNEL_VERSION}