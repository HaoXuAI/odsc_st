FROM openjdk:8

USER root

ENV SEATUNNEL_VERSION="2.3.3"
ENV SEATUNNEL_HOME="/opt/seatunnel"

RUN wget https://dlcdn.apache.org/seatunnel/${SEATUNNEL_VERSION}/apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz
RUN tar -xzvf apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz
RUN mv apache-seatunnel-${SEATUNNEL_VERSION} ${SEATUNNEL_HOME}

WORKDIR /opt/seatunnel

RUN bash bin/install-plugin.sh ${SEATUNNEL_VERSION}

EXPOSE 5801

ENTRYPOINT ["sh","-c"," bin/seatunnel-cluster.sh"]