# This is a sample Dockerfile to build Pillow on Arch Linux
# with all/most of the dependencies working.

FROM greyltc/archlinux

RUN pacman -Sy --noconfirm --overwrite "*libedit*,*readline.h,*histedit.h" libedit

RUN pacman -Sy --noconfirm gcc make openssl expat swig clang bison pcre2 ninja
RUN pacman -Sy --noconfirm python-pillow python-pip python-setuptools

ADD test.jp2 /test.jp2
RUN python3 -m pip install --break-system-packages --no-binary :all: pymupdf
RUN python3 -c "import pymupdf;from PIL import Image;image1 = Image.open('test.jp2');image1.save('out.png')"
