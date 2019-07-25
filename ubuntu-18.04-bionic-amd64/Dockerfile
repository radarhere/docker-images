FROM ubuntu:18.04 as ubuntu_base

RUN apt-get update -qq &&\
    apt-get install -qq curl &&\
    apt-get install -qq --no-install-recommends \
        libjpeg-turbo8-dev \
        python3-dev python-virtualenv \
    && rm -rf /var/lib/apt/lists/*

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
