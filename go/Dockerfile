FROM ubuntu

MAINTAINER Tony Holdstock-Brown

RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:tortoisehg-ppa/releases
RUN apt-get update
RUN apt-get install -y wget git mercurial build-essential

# Golang
WORKDIR /tmp
RUN wget -q https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.3.linux-amd64.tar.gz

RUN mkdir /go
RUN echo 'export PATH=/usr/local/go/bin:$PATH' >> /etc/profile.d/golang.sh
RUN echo 'export GOPATH=/go' >> /etc/profile.d/golang.sh

# Install GPM and GVP
WORKDIR /opt
RUN git clone https://github.com/pote/gpm.git
WORKDIR /opt/gpm
RUN git checkout v1.2.3
RUN ./configure
RUN make install

WORKDIR /opt
RUN git clone https://github.com/pote/gvp.git
WORKDIR /opt/gvp
RUN ./configure
RUN make install

# Our typical port which our Go programs listen on
EXPOSE 9000

CMD ['/usr/local/go/bin/go']
