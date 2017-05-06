FROM alpine:latest
MAINTAINER Michal Fojtak <mfojtak@seznam.cz>

RUN apk add --update curl util-linux tar && \
    rm -rf /var/cache/apk/* && \
    curl https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz | tar xvz && \
    #cp docker/* /usr/bin/
    
ADD start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/bin/sh", "/start.sh"]
