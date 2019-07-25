FROM ubuntu:18.04 as ubuntu_base

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y \
    install sudo xvfb \
    git wget python-virtualenv python-numpy python-scipy netpbm \
    python-pyqt5 ghostscript libffi-dev libjpeg-turbo8-dev \
    python-dev python-setuptools \
    python3-dev cmake  \
    libtiff5-dev libopenjp2-7-dev zlib1g-dev \
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

RUN ls /vpy3/bin

RUN /vpy3/bin/python3 /depends/jpeg.py &&\
    dpkg-query -s 'libjpeg-turbo8'
