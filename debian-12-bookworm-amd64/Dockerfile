# Originally from https://github.com/M0E-lnx/ubuntu-32bit with thanks,
# and then https://github.com/matthew-brett/trusty/blob/32/Dockerfile

FROM scratch
ADD debian-bookworm-amd64.tgz /

# a few minor docker-specific tweaks
# see https://github.com/docker/docker/blob/master/contrib/mkimage/debootstrap
RUN echo '#!/bin/sh' > /usr/sbin/policy-rc.d \
    && echo 'exit 101' >> /usr/sbin/policy-rc.d \
    && chmod +x /usr/sbin/policy-rc.d \
    \
    && dpkg-divert --local --rename --add /sbin/initctl \
    && cp -a /usr/sbin/policy-rc.d /sbin/initctl \
    && sed -i 's/^exit.*/exit 0/' /sbin/initctl \
    \
    && echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \
    \
    && echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean \
    && echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean \
    && echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean \
    \
    && echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages \
    \
    && echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes

#    && echo 'deb http://archive.ubuntu.com/ubuntu/ trusty universe' >> /etc/apt/sources.list \
#    && echo 'deb http://archive.ubuntu.com/ubuntu/ trusty-updates universe' >> /etc/apt/sources.list

#
# Pillow customization
#

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    cmake \
    curl \
    ghostscript \
    git \
    libffi-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libjpeg-turbo-progs \
    libjpeg62-turbo-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libwebp-dev \
    libssl-dev \
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

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN useradd pillow \
    && mkdir /home/pillow \
    && chown pillow:pillow /home/pillow

COPY Image00386.tiff .

RUN virtualenv -p /usr/bin/python3.11 --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --no-cache-dir --upgrade pip \
    && /vpy3/bin/pip install --no-cache-dir Pillow==9.5.0

RUN /vpy3/bin/python -c "from PIL import features;print('libtiff version', features.version_codec('libtiff'))"
RUN /vpy3/bin/python -c "from PIL import Image;im = Image.open('Image00386.tiff');im.save('toto2.tiff', compression='tiff_deflate')"

