FROM ruby:2.6.0-alpine3.8

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev" \
    RUBY_PACKAGES="ruby-json yaml"

RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN bundle config build.nokogiri --use-system-libraries && \
        bundle install && \
        bundle clean

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
