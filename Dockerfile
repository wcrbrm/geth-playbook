
FROM golang:1.12-alpine as builder
RUN apk add --no-cache make gcc musl-dev linux-headers git bash
RUN go get -u github.com/ethereum/go-ethereum
RUN cd /go/src/github.com/ethereum/go-ethereum && make geth
RUN go get -u github.com/AtlantPlatform/ethereum-playbook

ENTRYPOINT ["tail", "-f", "/dev/null" ]
