FROM gentoo/stage3:desktop

# Disable bits which don't work within Docker.
RUN echo 'FEATURES="-ipc-sandbox -pid-sandbox -network-sandbox -usersandbox -mount-sandbox -sandbox"' | cat >> /etc/portage/make.conf
# Speed things up a bit.
RUN echo 'FEATURES="${FEATURES} parallel-install parallel-fetch -merge-sync"' | cat >> /etc/portage/make.conf
# We use binpkgs.
RUN echo 'FEATURES="${FEATURES} getbinpkg binpkg-request-signature"' | cat >> /etc/portage/make.conf

RUN echo 'EMERGE_DEFAULT_OPTS="--autounmask-write --autounmask-continue --autounmask-keep-keywords=y --autounmask-use=y"' | cat >> /etc/portage/make.conf
RUN echo 'USE="elogind -polkit"' | cat >> /etc/portage/make.conf
RUN cat /etc/portage/make.conf

RUN emerge-webrsync --quiet || true
RUN eselect news read --quiet all || true

# Make sure everything is consistent first.
RUN emerge --quiet -uDU @world

# We're not running on real hardware, so set basic values instead.
# We deliberately set this quite late on to avoid rebuilding e.g. mesa.
RUN echo 'VIDEO_CARDS="fbdev dummy"' | cat >> /etc/portage/make.conf

RUN emerge --quiet sudo dev-util/cargo-c dev-build/meson x11-misc/xvfb-run dev-vcs/git

RUN useradd --uid 1001 pillow \
    && chown pillow:pillow /home/pillow

ADD depends /depends
RUN cd /depends && ./install_libavif.sh && ldconfig

USER pillow
CMD ["depends/test.sh"]

#docker run -v $GITHUB_WORKSPACE:/Pillow pythonpillow/gentoo
