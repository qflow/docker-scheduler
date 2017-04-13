FROM alpine:latest
MAINTAINER Michal Fojtak <mfojtak@seznam.cz>

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*
    
ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]
