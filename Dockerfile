FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs git mysql-client
RUN mkdir /advanon
WORKDIR /advanon
COPY Gemfile /advanon/Gemfile
COPY Gemfile.lock /advanon/Gemfile.lock
RUN bundle install
COPY . /advanon
