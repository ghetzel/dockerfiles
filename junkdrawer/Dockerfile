FROM golang:1.14.4-alpine3.12

ENV GO111MODULE on
RUN apk update && apk add --no-cache bash gcc g++ sqlite-dev libsass-dev libsass ca-certificates curl wget make socat git jq ffmpeg taglib taglib-dev rsync

RUN go get github.com/ghetzel/diecast/cmd/diecast
RUN go get github.com/ghetzel/clitools/cmd/...
RUN go get github.com/ghetzel/autotag
RUN go get github.com/ghetzel/qcat/cmd/qcat
RUN go get github.com/ghetzel/command-deck
RUN go get github.com/ghetzel/sysfact/cmd/sysfact

RUN chmod -v 0755 /go/bin/*
RUN rsync -av /go/bin/ /usr/bin/
RUN rm -rf /go/pkg /go/src

ADD https://storage.googleapis.com/kubernetes-release/release/v1.18.3/bin/linux/amd64/kubectl /usr/bin/kubectl

RUN mkdir /config /webroot
RUN rm -rf /usr/local/go /usr/libexec/gcc

ENV DIECAST_ALLOW_ROOT_ACTIONS true
WORKDIR /webroot
ENTRYPOINT ["/bin/bash"]