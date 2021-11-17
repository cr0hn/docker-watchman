FROM alpine:edge

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing watchman && \
    apk update &&  \
    apk add --no-cache watchman py3-pip python3-dev gcc g++ && \
    pip3 install pywatchman && \
    mkdir -p /var/run/watchman/root-state

RUN mkdir -p /data && \
    watchman watch /data

#ENTRYPOINT "watchman-wait /data/yaml-files"
CMD ["watchman-wait", "--max-events", "0", "/data"]
