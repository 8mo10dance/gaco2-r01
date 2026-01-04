FROM ruby:2.7.8

WORKDIR /rails

# Node のバージョン18以上が要求されるため
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get update && \
    apt-get install -y nodejs
RUN npm i -g yarn

# bundle install 時の ffi-1.17.1-x86_64-linux-musl のエラーのため
RUN gem update --system 3.3.22

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY package.json yarn.lock .
RUN yarn install

COPY . .

RUN yarn build && \
    SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

EXPOSE 3000
CMD bash -c "rm -f tmp/pids/server.pid && bin/dev"
