FROM codelittinc/ruby:2.2
MAINTAINER Codelitt, Inc.

# Mount any shared volumes from host to container @ /share
VOLUME ["/share"]

ENV LANGUAGE en_US.UTF-8

# Install dependencies
RUN apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/* \
    ruby2.2 \
    ruby2.2-dev \
    build-essential \
    curl \
    zlib1g-dev \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    libxml2-dev \
    libxslt-dev \
    libpq-dev

WORKDIR /share

CMD ["/bin/bash", "-l"]
