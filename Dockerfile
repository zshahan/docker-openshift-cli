FROM alpine:3.5

MAINTAINER Zack Shahan "z.shahan@gmail.com"

RUN apk add --no-cache --virtual .oc-deps \
    curl \
    tar \
    docker \
    && apk del .oc-deps

RUN curl -o oc-tools.tar.gz https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-server-v3.6.0-c4dd4cf-linux-64bit.tar.gz
RUN tar -xzf oc-tools.tar.gz && rm -f oc-tools.tar.gz
RUN ln -s /openshift-origin-server-v3.6.0-c4dd4cf-linux-64bit/oc /bin/oc

USER 1001

CMD ["oc", "help"]

