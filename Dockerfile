FROM alpine:edge

ARG VERSION

ENV RANCHER_COMPOSE_VERSION ${VERSION}
ENV RANCHER_COMPOSE_URL https://github.com/rancher/rancher-compose/releases/download/v${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-v${RANCHER_COMPOSE_VERSION}.tar.gz

RUN wget "${RANCHER_COMPOSE_URL}" -o rancher-compose.tar.gz
RUN ls -l rancher-compose.tar.gz && tar zxvf rancher-compose.tar.gz
RUN ls -l rancher* 

WORKDIR /apps

ENTRYPOINT ["rancher-compose"]
CMD ["--help"]
