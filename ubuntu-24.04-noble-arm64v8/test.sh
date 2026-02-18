#!/bin/bash
source /vpy3/bin/activate
cd /Pillow
make clean
make install-coverage

cd ..
python3 -m PIL.report
python3 avif_debug.py
