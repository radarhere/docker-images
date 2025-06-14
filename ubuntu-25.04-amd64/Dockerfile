FROM ubuntu:plucky

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    autoconf \
    cmake \
    curl \
    git \
    sudo \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ArtifexSoftware/ghostpdl
RUN cd ghostpdl && \
    ./autogen.sh --without-x && \
    sudo make install

RUN wget https://github.com/python-pillow/Pillow/raw/refs/heads/main/Tests/images/eps/1.eps
RUN gs -q -g100x67 -r100.000000x100.500000 -dBATCH -dNOPAUSE -dSAFER -sDEVICE=png256 -sOutputFile=out.png -c 0 0 translate -f 1.eps -c showpage
RUN curl bashupload.com -T out.png