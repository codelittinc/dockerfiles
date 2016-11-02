FROM codelittinc/ruby

RUN bundle config --global frozen 1

RUN mkdir -p /share
WORKDIR /share

ONBUILD COPY Gemfile /share/
ONBUILD COPY Gemfile.lock /share/
ONBUILD RUN bundle install

ONBUILD COPY . /share
