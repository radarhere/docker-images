FROM ubuntu:18.04 as ubuntu_base

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y \
    install sudo xvfb \
    git wget python-virtualenv python-numpy python-scipy netpbm \
    python-pyqt5 ghostscript libffi-dev libjpeg-turbo-progs \
    python-dev python-setuptools \
    python3-dev cmake  \
    libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev \
    python-tk python3-tk \
    libharfbuzz-dev libfribidi-dev && apt-get clean

RUN useradd pillow && addgroup pillow sudo && \
    mkdir /home/pillow && chown pillow:pillow /home/pillow

RUN virtualenv -p /usr/bin/python3.6 --system-site-packages /vpy3 && \
    /vpy3/bin/pip install --upgrade pip && \
    /vpy3/bin/pip install cffi olefile pytest pytest-cov && \
    chown -R pillow:pillow /vpy3

ADD depends /depends
RUN cd /depends

USER pillow
CMD ["depends/test.sh"]

RUN python3 --version  &&\
    python3 -c "from PIL import features, __version__; \
        print(__version__); \
        print(features.check_feature('libjpeg_turbo')); \
        print(features.check('jpg')); \
        print(features.get_supported_features())" &&\
    dpkg-query -s 'libjpeg-turbo8'
