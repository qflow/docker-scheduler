FROM alpine:latest
MAINTAINER Michal Fojtak <mfojtak@seznam.cz>

RUN apk add --update curl util-linux dos2unix && \
    rm -rf /var/cache/apk/*
    
ADD start.sh /start.sh
RUN chmod +x /start.sh && dos2unix /start.sh

ENTRYPOINT ["/start.sh"]
