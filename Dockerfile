FROM golang:bullseye AS configurator

WORKDIR /usr/src/app/

COPY ./tools/configurator ./
RUN go mod download && go mod verify

COPY ./tools/configurator ./
RUN go build -o /usr/src/app/configurator -ldflags "-s -w" -v ./main.go



FROM debian:bullseye-slim AS download

ARG BRANCH=release

WORKDIR /build/

RUN apt-get update
RUN apt-get install -y wget
RUN wget --no-cache -q -O ./update.json https://cdn.alt-mp.com/voice-server/${BRANCH}/x64_linux/update.json
RUN wget --no-cache -q -O ./altv-voice-server https://cdn.alt-mp.com/voice-server/${BRANCH}/x64_linux/altv-voice-server



FROM debian:bullseye-slim

ARG BRANCH=release

COPY ./.docker/scripts/entrypoint.sh /root/entrypoint.sh
COPY --from=download /build/altv-voice-server /opt/altv-voice-server/server
COPY --from=configurator /usr/src/app/configurator /opt/altv-voice-server/configurator

WORKDIR /opt/altv-voice-server/

RUN apt-get update && \
    apt-get install -y libatomic1 && \
    chmod +x ./server /root/entrypoint.sh && \
    apt-get clean

EXPOSE 7798/udp
EXPOSE 7799/udp

ENTRYPOINT [ "/root/entrypoint.sh" ]
