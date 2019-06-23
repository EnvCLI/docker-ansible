############################################################
# Dockerfile
############################################################

# Set the base image
FROM alpine:latest

############################################################
# Configuration
############################################################
ENV VERSION "2.8.1"

############################################################
# Installation
############################################################

RUN apk add --no-cache bash curl openssh-client python3 python3-dev build-base libffi-dev openssl-dev &&\
    pip3 install --upgrade pip &&\
    pip3 install ansible==${VERSION} &&\
	apk del --no-cache curl python3-dev build-base libffi-dev openssl-dev > /dev/null

############################################################
# Execution
############################################################
CMD ["ansible", "--help"]
