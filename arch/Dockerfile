# This is a sample Dockerfile to build Pillow on Arch Linux
# with all/most of the dependencies working.

FROM greyltc/archlinux

RUN pacman -Sy --noconfirm --overwrite "*libedit*,*readline.h,*histedit.h" libedit

RUN pacman -Sy --noconfirm openssl expat
RUN pacman -Sy --noconfirm gcc make extra/freetype2 extra/fribidi extra/harfbuzz extra/lcms2 extra/libjpeg-turbo extra/libtiff extra/libwebp extra/openjpeg2
RUN pacman -Sy --noconfirm python-pymupdf python-pip

ADD test.jp2 /test.jp2
RUN python3 -m pip install --break-system-packages pybind11
RUN python3 -m pip install --break-system-packages --no-binary :all: Pillow
RUN python3 -c "import pymupdf;from PIL import Image;image1 = Image.open('test.jp2');image1.save('out.png')"
