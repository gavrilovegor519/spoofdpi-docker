FROM alpine:3.20
COPY ./spoof-dpi /
CMD /spoof-dpi -addr 0.0.0.0 -enable-doh -no-banner -window-size 0 -timeout 10000 -port 8888
