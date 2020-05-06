FROM golang:1.14-alpine as build
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh make bzr

WORKDIR /workspace
ENV GO111MODULE on
RUN go get github.com/liftbridge-io/liftbridge

FROM gcr.io/distroless/base-debian10
COPY --from=build /go/bin/liftbridge /liftbridge
CMD ["/liftbridge"]