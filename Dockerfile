FROM alpine:3.3

ENTRYPOINT ["/IntegrationTest/test.sh"]

ENV KUBE_LATEST_VERSION="v1.5.4"

 RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /bin/kubectl \
 && chmod +x /bin/kubectl \
 && apk add --update git \
 && git clone https://github.com/juliole/IntegrationTest.git \
 && apk del --purge deps \
 && rm /var/cache/apk/* 
