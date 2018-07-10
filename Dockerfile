FROM openjdk:8
ARG MULECE_VERSION=3.9.0
ARG MULE_FOLDER=mule-standalone-${MULECE_VERSION}
ARG MULE_ARCHIVE=${MULE_FOLDER}.tar.gz
ARG http_proxy
ARG https_proxy
ENV MULE_HOME /opt/mule
ENV PATH=$PATH:${MULE_HOME}/bin
RUN apt-get install -y wget
RUN wget https://repository.mulesoft.org/nexus/content/repositories/public/org/mule/distributions/mule-standalone/${MULECE_VERSION}/mule-standalone-${MULECE_VERSION}.tar.gz
RUN tar xvfz ${MULE_ARCHIVE}
RUN rm ${MULE_ARCHIVE}
RUN mv ${MULE_FOLDER} ${MULE_HOME}
WORKDIR /opt/mule
RUN rm -rf examples
RUN rm -rf src
RUN rm -rf apps/default
VOLUME ["/opt/mule/logs"]
CMD [ "/opt/mule/bin/mule" ]
EXPOSE 8081
