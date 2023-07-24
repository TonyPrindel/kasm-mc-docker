# Copyright 2023 Tony Prindel

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine318

LABEL org.opencontainers.image.source=https://github.com/TonyPrindel/kasm-mc-docker
LABEL org.opencontainers.image.description="Basic Minecraft server Docker container based on linuxserver's kasmvnc."
LABEL org.opencontainers.image.licenses=Apache-2.0

VOLUME /server/

EXPOSE 25565/tcp
EXPOSE 25565/udp

ENV JAVA_ARGS="-Xms1024M -Xmx1024M"
ENV JAR_NAME="server.jar"
ENV AUTO_RESTART="true"
ENV PUID=1000
ENV PGID=1000

COPY defaults /defaults

ARG JAVA_VERSION=17
RUN apk add --no-cache --update openjdk${JAVA_VERSION};
