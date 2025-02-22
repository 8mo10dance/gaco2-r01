FROM ruby:2.7.5

WORKDIR /rails

# Node のバージョン18以上が要求されるため
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get update && \
    apt-get install -y nodejs
RUN npm i -g yarn

# bundle install 時の ffi-1.17.1-x86_64-linux-musl のエラーのため
RUN gem update --system 3.3.22

EXPOSE 3000
CMD bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0"
