FROM gentoo/stage3

RUN echo 'USE="xvfb X elogind"' | cat >> /etc/portage/make.conf
RUN echo 'FEATURES="-ipc-sandbox -pid-sandbox -network-sandbox -usersandbox -mount-sandbox -sandbox"' | cat >> /etc/portage/make.conf
RUN cat /etc/portage/make.conf
RUN emerge --quiet --sync || true
RUN emerge media-libs/libjpeg-turbo sys-libs/zlib app-text/ghostscript-gpl
RUN emerge -v1 --with-test-deps dev-python/pillow
RUN FEATURES=test emerge -v1 dev-python/pillow
