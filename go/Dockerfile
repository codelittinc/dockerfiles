FROM ubuntu

MAINTAINER Tony Holdstock-Brown

# First, install python-software-properties to add-apt-repository for mercurial.
# Then, install wget, git etc. for Golang.
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    python-software-properties && \
    add-apt-repository -y ppa:tortoisehg-ppa/releases && \
    apt-get update && \
    apt-get install -y wget \
    git \
    mercurial \
    build-essential \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Golang
WORKDIR /tmp
RUN wget -q https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.3.1.linux-amd64.tar.gz

RUN mkdir /go
RUN echo 'export PATH=/usr/local/go/bin:$PATH' >> /etc/profile.d/golang.sh
RUN echo 'export GOPATH=/go' >> /etc/profile.d/golang.sh

# Install GPM and GVP
WORKDIR /opt
RUN git clone https://github.com/pote/gpm.git
WORKDIR /opt/gpm
RUN git checkout v1.2.3 \
    && ./configure \
    && make install

WORKDIR /opt
RUN git clone https://github.com/pote/gvp.git
WORKDIR /opt/gvp
RUN ./configure && make install

WORKDIR /go

# Our typical port which our Go programs listen on
EXPOSE 9000

CMD ['/bin/bash -l']
