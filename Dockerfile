FROM alpine:latest
MAINTAINER Michal Fojtak <mfojtak@seznam.cz>

RUN apk add --update curl util-linux coreutils tar && \
    rm -rf /var/cache/apk/* && \
    curl -o docker.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz
RUN tar -xvzf docker.tgz
RUN cp docker/* /usr/bin/
    
ADD start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/bin/sh", "/start.sh"]
