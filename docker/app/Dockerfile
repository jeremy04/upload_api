FROM ruby:2.4-slim
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs libvips-dev libvips vim
RUN mkdir -p /app
WORKDIR /app
COPY . .
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
