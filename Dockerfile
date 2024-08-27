FROM golang:alpine AS builder
WORKDIR /go
RUN go install github.com/xvzc/SpoofDPI/cmd/spoofdpi@0.10.12

FROM gcr.io/distroless/static-debian12
COPY --from=builder /go/bin/spoofdpi /
CMD ["/spoofdpi", "-addr", "0.0.0.0", "-enable-doh", "-window-size", "0", "-timeout", "10000"]
