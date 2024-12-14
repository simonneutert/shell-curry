FROM ruby:3.3-bookworm

WORKDIR /app

ENV LANG=C.UTF-8
ENV TZ=Europe/Berlin
ENV RUBY_YJIT_ENABLE=1

COPY Gemfile Gemfile.lock /app/
RUN bundle install -j2

ADD . .

CMD ["bundle", "exec", "jekyll", "server", "--host", "0.0.0.0"]