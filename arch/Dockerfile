# This is a sample Dockerfile to build Pillow on Arch Linux
# with all/most of the dependencies working.

FROM greyltc/archlinux

RUN pacman -Syu --noconfirm \
            wget \
    && find /var/cache/pacman/ -type f -delete

RUN pacman -Sy --noconfirm --overwrite "*libedit*,*readline.h,*histedit.h" libedit

RUN pacman -Sy --noconfirm \
            cargo \
            extra/libjpeg-turbo \
            extra/tk \
            gcc \
            ghostscript \
            git \
            make \
            mesa-libgl \
            pkg-config \
            python \
            python-setuptools \
            python-virtualenv \
            sudo \
            xorg-server-xvfb \
    && find /var/cache/pacman/ -type f -delete

ADD depends /depends

ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

RUN /sbin/useradd -m -U --uid 1001 pillow \
    && virtualenv --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --upgrade pip \
    && /vpy3/bin/pip install pytest pytest-cov pytest-timeout \
    && chown -R pillow:pillow /vpy3

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/arch
