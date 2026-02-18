FROM amazonlinux:2023

RUN yum install -y \
    python3.11-devel \
    python3.11-pip \
    python3.11-test \
    python3.11-tkinter \
    shadow-utils \
    sudo \
    && yum clean all

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN useradd --uid 1001 pillow

ARG PIP_DISABLE_PIP_VERSION_CHECK=1
ARG PIP_NO_CACHE_DIR=1

RUN bash -c "/usr/bin/python3.11 -m pip install virtualenv \
    && /usr/bin/python3.11 -mvirtualenv -p /usr/bin/python3.11 --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --upgrade pip \
    && /vpy3/bin/pip install Pillow \
    && chown -R pillow:pillow /vpy3"

ADD depends /depends
ADD 1_trns.png /input.png
ADD avif_debug.py /avif_debug.py

ENV FORCE_COLOR=1

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/amazon-2023-amd64
