FROM golang:alpine as builder

WORKDIR /usr/local/go_challenge

COPY . . /usr/local/go_challenge/

RUN go build -o hello hello.go

CMD ["./hello"]

FROM scratch

WORKDIR /go_challeng

COPY --from=builder /usr/local/go_challenge/hello /go_challeng


CMD ["./hello"]