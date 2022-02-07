FROM gentoo/stage3

RUN emerge --quiet --sync || true
RUN emerge media-libs/libjpeg-turbo sys-libs/zlib app-text/ghostscript-gpl
RUN python3 -m ensurepip
RUN python3 -m pip install Pillow pytest

ADD Pillow /Pillow
RUN cd Pillow && python3 -m pytest
