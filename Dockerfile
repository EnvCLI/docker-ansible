############################################################
# Dockerfile
############################################################

# Set the base image
FROM alpine:latest

############################################################
# Configuration
############################################################
ENV VERSION "2.8.2"
ENV PYTHONPATH="/usr/lib/python/site-packages"

############################################################
# Installation
############################################################

RUN apk add --no-cache --update bash curl openssh-client sshpass python3 python3-dev build-base libffi-dev openssl-dev &&\
    pip3 install --upgrade pip &&\
    # Install Ansible
    pip3 install ansible==${VERSION} &&\
    # Ansible Modules
    pip3 install --upgrade docker &&\
    # Symlink Python Modules into Pythonpath
    mkdir -p /usr/lib/python &&\
    ln -s /usr/lib/python3.*/site-packages /usr/lib/python/site-packages &&\
    # CleanUp
	apk del --no-cache curl python3-dev build-base libffi-dev openssl-dev > /dev/null

############################################################
# Execution
############################################################
CMD ["ansible", "--help"]
