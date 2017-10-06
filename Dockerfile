FROM alpine:3.5

MAINTAINER Zack Shahan "z.shahan@gmail.com"

RUN apk add --no-cache --virtual .oc-deps \
    curl \
    tar \
    docker \
    && curl -Lo oc-tools.tar.gz \
       https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-server-v3.6.0-c4dd4cf-linux-64bit.tar.gz \
    && tar -xzf oc-tools.tar.gz \
    && rm -f oc-tools.tar.gz \
    && ln -s /openshift-origin-server-v3.6.0-c4dd4cf-linux-64bit/oc /bin/oc \
    && apk del .oc-deps

USER 1001

CMD ["oc", "help"]

