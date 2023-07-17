FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine317

LABEL org.opencontainers.image.source=https://github.com/TonyPrindel/kasm-mc-docker
LABEL org.opencontainers.image.description="Basic Minecraft server Docker container based on linuxserver's kasmvnc."
LABEL org.opencontainers.image.licenses=Apache-2.0

VOLUME /server/

EXPOSE 25565/tcp
EXPOSE 25565/udp

ARG JAVA_VERSION=17
ARG USER_JAVA_ARGS="-Xms1024M -Xmx1024M"
ARG JAR_NAME="server.jar"

ENV USER_JAVA_ARGS=${USER_JAVA_ARGS}
ENV JAR_NAME=${JAR_NAME}

COPY root /

RUN apk add --no-cache --update openjdk${JAVA_VERSION};
