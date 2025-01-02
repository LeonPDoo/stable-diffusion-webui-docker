FROM bash:alpine3.19

RUN apk update && apk add parallel aria2 && apk add git
COPY . /docker
RUN chmod +x /docker/download.sh
ENTRYPOINT ["/docker/download.sh"]
