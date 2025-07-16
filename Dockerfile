FROM ruby:3.4.4-slim

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  postgresql-client \
  libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

EXPOSE 4000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "4000"]