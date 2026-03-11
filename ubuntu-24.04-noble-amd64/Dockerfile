FROM ubuntu:noble

RUN apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    ca-certificates \
    cmake \
    gcc \
    g++ \
    git \
    make \
    nasm \
    patch \
    pkg-config \
    sudo \
    wget \
    && rm -rf /var/lib/apt/lists/*

COPY depends /depends
RUN cd /depends \
    && ./install_libavif.sh
