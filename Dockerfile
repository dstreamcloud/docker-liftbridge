FROM golang:1.14 AS build
ENV GO111MODULE on
RUN go get github.com/liftbridge-io/liftbridge
RUN go get github.com/grpc-ecosystem/grpc-health-probe

FROM gcr.io/distroless/base-debian10
COPY --from=build /go/bin/liftbridge /liftbridge
COPY --from=build /go/bin/grpc-health-probe /grpc-health-probe
ENTRYPOINT ["/liftbridge"]

