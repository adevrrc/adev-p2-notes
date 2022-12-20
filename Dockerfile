FROM ruby:2.7-alpine3.15

# Add git
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update the Ruby bundler
RUN gem update bundler && gem install bundler jekyll