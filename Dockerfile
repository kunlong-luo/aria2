FROM centos

LABEL maintainer="TonyParkerLuo <luokl19970514@163.com>"

WORKDIR /workdir

EXPOSE 6800/tcp

ENV RPC_SECRET="token"

COPY aria2_linux_install.sh .
COPY aria2.conf .

RUN sudo chmod +x aria2_install.sh \
    && ./aria2_install.sh ${RPC_SECRET}