#!/bin/bash
source /vpy3/bin/activate
cd /Pillow
make clean
python3 -m setup.py install
python3 -c "from PIL import Image"
/usr/bin/xvfb-run -a pytest -vx --cov PIL --cov-report term Tests
