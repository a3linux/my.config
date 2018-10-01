FROM alpine:latest
MAINTAINER Allen Chen(a3linux@gmail.com)

ADD shadowsocks-server /usr/local/bin/shadowsocks-server
ADD config.json /usr/local/bin/config.json

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/shadowsocks-server"]
