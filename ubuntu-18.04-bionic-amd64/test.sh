#!/bin/bash
source /vpy3/bin/activate
make clean
make install-coverage
/usr/bin/xvfb-run -a pytest -svx /depends
