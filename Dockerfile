FROM ruby:3.2.5
WORKDIR /app
COPY . /app
RUN bundle install
EXPOSE 3000