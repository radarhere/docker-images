FROM arm64v8/ubuntu:noble

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    python3-dev \
    python3-setuptools \
    python3-tk \
    sudo \
    tcl8.6-dev \
    tk8.6-dev \
    virtualenv \
    && rm -rf /var/lib/apt/lists/*

RUN useradd pillow \
    && mkdir /home/pillow \
    && chown pillow:pillow /home/pillow

ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

ADD pillow-12.2.0.dev0-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl /pillow-12.2.0.dev0-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl

RUN virtualenv -p /usr/bin/python3.12 --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --upgrade pip \
    && /vpy3/bin/pip install pillow-12.2.0.dev0-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl \
    && chown -R pillow:pillow /vpy3

ADD depends /depends
ADD 1_trns.png /input.png
ADD avif_debug.py /avif_debug.py

ENV FORCE_COLOR=1

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/ubuntu-24.04-noble-arm64v8

