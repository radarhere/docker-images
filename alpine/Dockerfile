# This is a sample Dockerfile to build Pillow on Alpine Linux
# with all/most of the dependencies working.
#
# Tcl/Tk isn't detecting
# Freetype has different metrics so tests are failing.
# sudo and bash are required for the webp build script.

FROM python:3.8.3-alpine3.11

RUN apk add --update-cache \
        pcre-dev \
        libc-dev \
        linux-headers \
        python3-dev \
        nginx \
        curl \
        bash \
        gcc \
        g++ \
        uwsgi-python3 \
        # psycopg
        postgresql-dev \
        musl-dev \
        libffi-dev \
        freetype-dev \
        lcms2-dev \
        # PILLOW
        jpeg-dev \
        zlib-dev \
        # pylibmc
        libmemcached-dev \
        openjpeg-dev \
        jpeg \
        libjpeg \
        openjpeg \
        tiff-dev \
        tk-dev \
        tcl-dev \
        harfbuzz-dev \
        fribidi-dev \
        # opencv
        make \
        cmake \
        clang \
        clang-dev \
        ninja \
        # tesseract
        leptonica-dev \
        tesseract-ocr \
        tesseract-ocr-dev \
        openssh-server \
        py3-pip

RUN pip3 install -I virtualenv && virtualenv /vpy3 && \
    /vpy3/bin/pip install --upgrade pip && \
    /vpy3/bin/pip install pillow && \
    /vpy3/bin/python -c 'from PIL import Image;print(Image.__version__)'
