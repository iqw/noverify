FROM golang:1.14 as builder
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go get -u github.com/VKCOM/noverify

FROM scratch
COPY --from=builder /go/bin/noverify /noverify
ENTRYPOINT ["./noverify"]
