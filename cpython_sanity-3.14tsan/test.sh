#!/bin/bash
source /vpy3/bin/activate
cd /Pillow
make clean
echo "torch"
id
echo "torch1"
make install-tsan
echo "torch2"
/usr/bin/xvfb-run -a .ci/test.sh
echo "torch3"
