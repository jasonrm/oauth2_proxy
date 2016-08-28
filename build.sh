#!/bin/sh
DEPS="ca-certificates"
BUILD_DEPS="go git" # build-base libarchive-dev autoconf automake
apk add --update ${DEPS} ${BUILD_DEPS}

# I wouldn't know where to start describing how much I dislike the golang build process
## Go build env
mkdir -p /go/src /go/bin
chmod -R 777 /go
export GOPATH=/go
export PATH=/go/bin:$PATH

# Install gof3r
go get github.com/bitly/oauth2_proxy
cd /go/src/github.com/bitly/oauth2_proxy
CGO_ENABLED=0 GOOS=linux go build -a .
cp oauth2_proxy /usr/local/bin/

# Cleanup
apk del ${BUILD_DEPS}
rm -rf /var/cache/apk/*
rm -rf /go

rm /$0
