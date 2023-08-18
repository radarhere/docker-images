FROM ppc64le/ubuntu:mantic

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    cargo \
    cargo-c\
    cmake \
    ghostscript \
    git \
    libffi-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libjpeg-turbo-progs \
    libjpeg8-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libssl-dev \
    libtiff5-dev \
    libwebp-dev \
    meson \
    netpbm \
    python3-dev \
    python3-numpy \
    python3-setuptools \
    python3-tk \
    sudo \
    tcl8.6-dev \
    tk8.6-dev \
    virtualenv \
    wget \
    xvfb \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN useradd pillow \
    && mkdir /home/pillow \
    && chown pillow:pillow /home/pillow

RUN virtualenv -p /usr/bin/python3.11 --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --no-cache-dir --upgrade pip \
    && /vpy3/bin/pip install --no-cache-dir cffi olefile pytest pytest-cov pytest-timeout \
    && chown -R pillow:pillow /vpy3

ADD depends /depends
RUN cd /depends \
    && ./download-and-extract.sh libimagequant-4.2.0 https://raw.githubusercontent.com/python-pillow/pillow-depends/main/libimagequant-4.2.0.tar.gz \
    && cd libimagequant-4.2.0/imagequant-sys \
    && echo "torch1" \
    && echo "torch2" \
    && CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse cargo cinstall --prefix=/usr --destdir=. \
    && echo "torch3" \
    && sudo cp usr/lib/libimagequant.so* /usr/lib/ \
    && sudo cp usr/include/libimagequant.h /usr/include/ \
    && cd ../.. \
    && ./install_raqm.sh

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/ubuntu-22.04-jammy-ppc64le
