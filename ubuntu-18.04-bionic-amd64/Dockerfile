FROM ubuntu:18.04 as ubuntu_base

RUN apt-get update -qq &&\
    apt-get install -qq curl &&\
    apt-get install -qq --no-install-recommends \
        libjpeg-turbo8-dev \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl --silent --show-error \
    https://bootstrap.pypa.io/get-pip.py | python3

RUN pip install pillow

RUN python3 --version  &&\
    python3 -c "from PIL import features, __version__; \
        print(__version__); \
        print(features.check_feature('libjpeg_turbo')); \
        print(features.check('jpg')); \
        print(features.get_supported_features())" &&\
    dpkg-query -s 'libjpeg-turbo8'
