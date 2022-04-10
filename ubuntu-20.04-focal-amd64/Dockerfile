FROM ubuntu:focal

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    autoconf \
    automake \
    cmake \
    curl \
    git \
    libegl-dev \
    libffi-dev \
    libpng-dev \
    libtool \
    make \
    nasm \
    pkg-config \
    python3-dev \
    python3-pip \
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

RUN git clone https://github.com/mozilla/mozjpeg.git
RUN cd mozjpeg \
    && mkdir build \
    && cd build \
    && sudo cmake -G"Unix Makefiles" ../ \
    && sudo make install

RUN echo "torch ls"
RUN ls -la /opt/mozjpeg/lib64/
#RUN export LD_LIBRARY_PATH=/opt/mozjpeg/lib64
RUN cp /opt/mozjpeg/lib64/libjpeg.so.62 .
RUN cp /opt/mozjpeg/lib64/libjpeg.so.62 /usr/local/lib
RUN unlink /opt/mozjpeg/lib64/libjpeg.so
RUN cp /opt/mozjpeg/lib64/libjpeg.so.62.3.0 /opt/mozjpeg/lib64/libjpeg.so

RUN useradd pillow \
    && addgroup pillow sudo \
    && mkdir /home/pillow \
    && chown pillow:pillow /home/pillow

RUN virtualenv -p /usr/bin/python3.8 --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --no-cache-dir --upgrade pip \
    && /vpy3/bin/pip install --no-cache-dir cffi olefile pytest pytest-cov pytest-timeout \
    && chown -R pillow:pillow /vpy3

ADD depends /depends

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/ubuntu-20.04-focal-amd64
