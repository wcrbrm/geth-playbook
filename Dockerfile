FROM golang:1.12-alpine as builder
RUN apk add --no-cache make gcc musl-dev linux-headers git bash
RUN go get -u github.com/ethereum/go-ethereum
RUN cd /go/src/github.com/ethereum/go-ethereum && make geth
RUN go get -u github.com/AtlantPlatform/ethereum-playbook

FROM ethereum/solc:nightly-alpine
COPY --from=0 /go/src/github.com/ethereum/go-ethereum/build/bin/ /usr/local/bin/
COPY --from=0 /go/bin/* /usr/local/bin/
ENTRYPOINT ["tail", "-f", "/dev/null" ]
