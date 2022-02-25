FROM golang:1.17 as builder

WORKDIR /go/src

RUN go mod init example/rocks

COPY ./rocks.go .

RUN go build -o rocks


FROM scratch

COPY --from=builder /go/src/rocks .

ENTRYPOINT [ "./rocks" ]
