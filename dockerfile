FROM ruby:2.6.3

RUN apt-get update

RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_12.x 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev postgresql-client libxml2-dev libxslt1-dev \
libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn 

RUN mkdir /rentalcars
WORKDIR /rentalcars
COPY Gemfile* /rentalcars/
RUN bundle install
COPY . /rentalcars

CMD ["rails", "server", "-b", "0.0.0.0"]