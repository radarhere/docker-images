FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

RUN apt-get update && \
    apt-get install -y build-essential &&  \
    apt-get install -y sane-utils && \
    apt-get install -y libsane-dev && \
    apt-get install -y python3-dev && \
    apt-get install -y git && \
    apt-get install -y clang && \
    apt-get install -y tk && \
    apt-get install -y libffi-dev libssl-dev && \
    apt-get install -y python3-tk && \
    apt-get install -y libx11-6 libxss1 libxext6 libsm6 && \
    apt-get install -y --no-install-recommends \
    x11-utils xdg-utils libxrender1 libxrandr2 libxcursor1 libxtst6 libxi6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip wheel --no-cache-dir "python-sane (==2.9.1)"

