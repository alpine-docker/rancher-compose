FROM alpine

ARG VERSION

ENV RANCHER_COMPOSE_VERSION ${VERSION}
ENV RANCHER_COMPOSE_URL https://github.com/rancher/rancher-compose/releases/download/v${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-v${RANCHER_COMPOSE_VERSION}.tar.gz

RUN apk add --update --no-cache --virtual .build-deps ca-certificates curl unzip && \
	curl -sSL "${RANCHER_COMPOSE_URL}" | tar -xzp -C /usr/local/bin/ --strip-components=2 && \
        apk del .build-deps

WORKDIR /apps

ENTRYPOINT ["rancher-compose"]
CMD ["--help"]
