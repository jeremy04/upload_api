FROM ruby:2.4-slim
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs libvips-dev libvips
RUN mkdir -p /app
WORKDIR /app
COPY . .
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Add bundle entry point to handle bundle cache

#ENV BUNDLE_PATH=/bundle \
#    BUNDLE_BIN=/bundle/bin \
#    GEM_HOME=/bundle
#ENV PATH="${BUNDLE_BIN}:${PATH}"

# Bundle installs with binstubs to our custom /bundle/bin volume path.
# Let system use those stubs.
