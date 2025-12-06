FROM ubuntu:noble

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential \
    cmake \
    git \
    nasm \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.3.0.tar.gz \
    && tar xzf v1.3.0.tar.gz \
    && cd libavif-1.3.0 \
    && cmake \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DCMAKE_INSTALL_LIBDIR=/usr/local/lib \
        -DCMAKE_INSTALL_NAME_DIR=/usr/local/lib \
        -DBUILD_SHARED_LIBS=$build_shared \
        -DAVIF_LIBSHARPYUV=LOCAL \
        -DAVIF_LIBYUV=LOCAL \
        -DAVIF_CODEC_AOM=LOCAL \
        -DCONFIG_AV1_HIGHBITDEPTH=0 \
        -DCMAKE_C_VISIBILITY_PRESET=hidden \
        -DCMAKE_CXX_VISIBILITY_PRESET=hidden \
        . \
    && make -j4 install

RUN wget https://ixpeering.dl.sourceforge.net/project/lcms/lcms/2.17/lcms2-2.17.tar.gz \
    && tar xzf lcms2-2.17.tar.gz \
    && cd lcms2-2.17 \
    && ./configure --prefix=/usr/local \
    && make -j4 install

RUN wget https://github.com/google/brotli/archive/v1.2.0.tar.gz \
    && tar xzf v1.2.0.tar.gz \
    && cd brotli-1.2.0 \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=/usr/local/lib -DCMAKE_INSTALL_NAME_DIR=/usr/local/lib . \
    && make -j4 install

RUN wget https://github.com/google/highway/archive/1.3.0.tar.gz \
    && tar xzf 1.3.0.tar.gz \
    && cd highway-1.3.0 \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=/usr/local/lib -DCMAKE_INSTALL_NAME_DIR=/usr/local/lib . \
    && make -j4 install

RUN wget https://github.com/libjxl/libjxl/archive/v0.11.1.tar.gz \
    && tar xzf v0.11.1.tar.gz \
    && cd libjxl-0.11.1 \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=/usr/local/lib -DCMAKE_INSTALL_NAME_DIR=/usr/local/lib -DJPEGXL_ENABLE_SJPEG=OFF -DJPEGXL_ENABLE_SKCMS=OFF -DBUILD_TESTING=OFF . \
    && make -j4 install
