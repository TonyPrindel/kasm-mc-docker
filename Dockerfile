FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine317

VOLUME /server/

EXPOSE 25565/tcp
EXPOSE 25565/udp

ARG JAVA_VERSION=17
ARG USER_JAVA_ARGS="-Xms1024M -Xmx1024M"
ARG JAR_NAME="server.jar"

ENV USER_JAVA_ARGS=${USER_JAVA_ARGS}
ENV JAR_NAME=${JAR_NAME}

COPY root /

RUN apk add --no-cache openjdk${JAVA_VERSION};
