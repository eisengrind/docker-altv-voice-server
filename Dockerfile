
FROM debian:buster-slim

ARG BRANCH=release

COPY ./.docker/scripts/entrypoint.sh /root/

WORKDIR /opt/altv/

RUN apt-get update && \
    apt-get install -y wget libatomic1 && \
#
    wget --no-cache -q -O ./altv-voice-server http://cdn.altv.mp/voice-server/${BRANCH}/x64_linux/altv-voice-server && \
#
    chmod +x ./altv-voice-server /root/entrypoint.sh && \
#
    apt-get purge -y wget && \
    apt-get clean

EXPOSE 7798/udp
EXPOSE 7799/udp

ENTRYPOINT [ "/root/entrypoint.sh" ]
