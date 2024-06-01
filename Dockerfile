FROM golang
COPY . /go/src/github.com/o-alexandrov/rambler
WORKDIR /go/src/github.com/o-alexandrov/rambler
RUN go get ./...
RUN go build -ldflags="-s -linkmode external -extldflags -static -w"

FROM scratch
MAINTAINER Romain Baugue <romain.baugue@elwinar.com>
COPY --from=0 /go/src/github.com/o-alexandrov/rambler/rambler /
CMD ["/rambler", "apply", "-a"]
