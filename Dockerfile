FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm build-essential patch ruby-dev zlib1g-dev liblzma-dev
RUN npm install yarn -g
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY package.json /app/package.json
RUN yarn
COPY . /app
EXPOSE 3000