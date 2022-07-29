FROM golang:1.17-alpine3.14

# Install node, zip, git and make
RUN apk add --no-cache gcc libc-dev npm nodejs-current zip git openssh make

# Install aws cli
RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

# Install sp cli
ADD . /app
WORKDIR /app
RUN ls
RUN ls cli-test
RUN stat cli-test
RUN ls cli-test/cli-test
# RUN ./cli-test conn
# RUN ls cli-test/cli-test
# RUN go build .
RUN cp cli-test /usr/local/bin/sp
RUN sp conn
