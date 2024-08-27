FROM golang:alpine as builder
WORKDIR /go
RUN go install github.com/xvzc/SpoofDPI/cmd/spoofdpi@latest

FROM gcr.io/distroless/static-debian12
COPY --from=builder /go/bin/spoofdpi /
CMD ["/spoofdpi", "-addr", "0.0.0.0", "-enable-doh", "-no-banner", "-window-size", "0", "-timeout", "10000"]
