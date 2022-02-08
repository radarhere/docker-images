FROM gentoo/stage3

RUN echo 'USE="xvfb X elogind"' | cat >> /etc/portage/make.conf
RUN echo 'FEATURES="-ipc-sandbox -pid-sandbox -network-sandbox -usersandbox -mount-sandbox -sandbox"' | cat >> /etc/portage/make.conf
RUN cat /etc/portage/make.conf
RUN emerge --quiet --sync || true
RUN emerge -v1 dev-lang/rust-bin
RUN emerge media-libs/libjpeg-turbo sys-libs/zlib app-text/ghostscript-gpl
RUN USE="jpeg2k tiff truetype xvfb X elogind" emerge -v1 --with-test-deps dev-python/pillow
RUN FEATURES=test USE="jpeg2k tiff truetype xvfb X elogind" emerge -v1 dev-python/pillow