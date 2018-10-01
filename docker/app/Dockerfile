FROM phusion/passenger-ruby24:0.9.35
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential unzip wget tzdata

# stuff we need to build our own libvips
RUN apt-get install -y automake libtool swig gtk-doc-tools gobject-introspection libexpat1-dev libglib2.0-dev pkg-config

RUN \
  apt-get install -y \
    libpng-dev \
    libgif-dev \
    libjpeg-dev


# build in /build, install to /usr
# the version packaged for 16.04 is too old
WORKDIR /build
COPY ./install-vips.sh /build
RUN chmod +x install-vips.sh

RUN \
  ./install-vips.sh 8 6 3

RUN mkdir -p /app
WORKDIR /app
COPY . .
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
RUN /docker-entrypoint.sh
ENV HOME /root
CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

