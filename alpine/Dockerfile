FROM alpine:latest AS builder

RUN apk add --no-cache \
    build-base \
    pkgconf \
    zlib-dev \
    zstd-dev \
    xz-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    curl

ENV TIFF_VERSION=4.7.1
RUN curl -fsSL "https://download.osgeo.org/libtiff/tiff-${TIFF_VERSION}.tar.gz" \
    | tar xz -C /tmp \
    && mv /tmp/tiff-* /tmp/libtiff

WORKDIR /tmp/libtiff

RUN mkdir -p _build && cd _build \
    && ../configure \
        --prefix=/usr/local \
        --disable-shared \
        --enable-static \
        --disable-docs \
        --disable-tools \
        --disable-tests \
        --disable-contrib \
        --disable-libdeflate \
        --disable-lerc \
        --disable-jbig \
        --disable-cxx \
    && make -j \
    && make install

FROM alpine:latest

RUN apk add --no-cache pkgconf

# Feel free to add other dependencies needed by Pillow here
# but make sure NOT to add libtiff from distro because it will include .so libs!

COPY --from=builder /usr/local/lib/libtiff.a /usr/local/lib/
COPY --from=builder /usr/local/include/ /usr/local/include/
COPY --from=builder /usr/local/lib/pkgconfig/ /usr/local/lib/pkgconfig/

ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
