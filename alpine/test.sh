#!/bin/bash
source /vpy3/bin/activate
cd /Pillow
make clean
pytest -vx --cov PIL --cov-report term Tests
