FROM centos

LABEL maintainer="TonyParkerLuo <luokl19970514@163.com>"

WORKDIR /workdir

ENV RPC_SECRET="token"

COPY ./ .

VOLUME /config /downloads

EXPOSE 6800/tcp

RUN set -xe \
    && chmod +x aria2_install.sh

ENTRYPOINT aria2_install.sh ${RPC_SECRET}
