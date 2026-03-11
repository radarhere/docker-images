FROM amazonlinux:2023

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN yum install -y \
    cmake \
    gcc \
    g++ \
    git \
    make \
    nasm \
    patch \
    sudo \
    tar \
    wget \
    && yum clean all

COPY depends /depends
RUN cd /depends \
    && ./install_libavif.sh
