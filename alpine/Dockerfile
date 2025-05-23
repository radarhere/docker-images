# This is a sample Dockerfile to build Pillow on Alpine Linux
# with all/most of the dependencies working.
#
# Tcl/Tk isn't detecting
# Freetype has different metrics so tests are failing.
# sudo and bash are required for the webp build script.

FROM alpine

RUN apk --no-cache add \
    build-base \
    python3 \
    python3-dev \
    python3-tkinter \
    # wget dependency
    openssl \
    # dev dependencies
    bash \
    git \
    meson \
    py3-pip \
    py3-virtualenv \
    sudo \
    # Pillow dependencies
    freetype-dev \
    fribidi-dev \
    harfbuzz-dev \
    jpeg-dev \
    libavif-dev \
    lcms2-dev \
    libimagequant-dev \
    openjpeg-dev \
    tcl-dev \
    tiff-dev \
    tk-dev \
    zlib-dev

ADD depends /depends
RUN cd /depends \
    && ./install_webp.sh \
    && ./install_raqm.sh

ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

RUN /usr/sbin/adduser -D --uid 1001 pillow \
    && virtualenv /vpy3 \
    && /vpy3/bin/pip install --upgrade pip \
    && /vpy3/bin/pip install olefile pytest pytest-cov pytest-timeout \
    && /vpy3/bin/pip install numpy --only-binary=:all: || true \
    && chown -R pillow:pillow /vpy3

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/alpine
