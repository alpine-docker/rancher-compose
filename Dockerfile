FROM alpine:edge

ARG VERSION

ENV RANCHER_COMPOSE_VERSION ${VERSION}
ENV RANCHER_COMPOSE_URL https://github.com/rancher/rancher-compose/releases/download/v${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-v${RANCHER_COMPOSE_VERSION}.tar.gz

RUN apk add --update --no-cache --virtual .build-deps ca-certificates curl tar && \
	curl -L "${RANCHER_COMPOSE_URL}" | tar --gzip --extract --file - --directory /usr/local/bin/ --strip-components=2 && \
        apk del .build-deps

WORKDIR /apps

ENTRYPOINT ["rancher-compose"]
CMD ["--help"]
