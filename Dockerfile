FROM openjdk:8-alpine
ARG MULECE_VERSION=3.9.0
ARG MULE_FOLDER=mule-standalone-${MULECE_VERSION}
ARG MULE_ARCHIVE=${MULE_FOLDER}.tar.gz
ARG http_proxy
ARG https_proxy
RUN apk add wget maven
RUN wget https://repository.mulesoft.org/nexus/content/repositories/public/org/mule/distributions/mule-standalone/${MULECE_VERSION}/mule-standalone-${MULECE_VERSION}.tar.gz
RUN tar xvfz ${MULE_ARCHIVE}
RUN rm ${MULE_ARCHIVE}
RUN mkdir /opt
RUN mv ${MULE_FOLDER} /opt/mule
WORKDIR /opt/mule
RUN rm -rf examples
RUN rm -rf src
