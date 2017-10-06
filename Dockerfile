FROM alpine:3.5

MAINTAINER Zack Shahan "z.shahan@gmail.com"

RUN apk add --no-cache --virtual .oc-deps \
    curl \
    tar \
    docker \
    && apk del .oc-deps

RUN curl -o oc-tools.tar.gz https://github.com/openshift/origin/releases/download/v1.5.1/openshift-origin-client-tools-v1.5.1-7b451fc-linux-64bit.tar.gz
RUN tar -xzf oc-tools.tar.gz && rm -f oc-tools.tar.gz
RUN ln -s /oc-tools/oc /bin/oc

USER 1001

CMD ["oc", "help"]

