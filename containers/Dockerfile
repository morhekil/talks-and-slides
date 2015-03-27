FROM ubuntu

MAINTAINER Oleg Ivanov "https://github.com/morhekil"

# Install packages for building ruby
RUN apt-get update && \
    apt-get install -y --force-yes ruby && \
    apt-get clean && rm -rf /tmp/*

RUN gem install bundler

ADD clickme /root/clickme
RUN cd /root/clickme && bundle install

EXPOSE 4567
WORKDIR /root/clickme
CMD bundle exec ./clickme.rb
