FROM alpine:3.18 as build

RUN apk add --update make build-base

COPY . /udptunnel

RUN cd /udptunnel && make

FROM alpine:3.18

COPY --from=build /udptunnel/udptunnel /usr/bin/udptunnel

RUN addgroup -S tunnel && adduser -S -G tunnel tunnel
USER tunnel

ENTRYPOINT ["udptunnel"]