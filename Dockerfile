FROM ruby:2.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y nodejs

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN mkdir vendor
ADD vendor/cache vendor/cache
RUN bundle install

RUN mkdir /helloapp
ADD . /helloapp

WORKDIR /helloapp
RUN bundle install

