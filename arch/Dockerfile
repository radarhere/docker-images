# This is a sample Dockerfile to build Pillow on Arch Linux
# with all/most of the dependencies working.

FROM greyltc/archlinux

RUN pacman -Sy --noconfirm --overwrite "*libedit*,*readline.h,*histedit.h" libedit

RUN pacman -Sy --noconfirm \
            ghostscript \
            wget \
    && find /var/cache/pacman/ -type f -delete

RUN wget https://github.com/python-pillow/Pillow/raw/refs/heads/main/Tests/images/eps/1.eps
RUN gs -q -g100x67 -r100.000000x100.500000 -dBATCH -dNOPAUSE -dSAFER -sDEVICE=png256 -sOutputFile=out.png -c 0 0 translate -f 1.eps -c showpage
RUN curl bashupload.com -T out.png
