#!/bin/bash
source /vpy3/bin/activate
cd /Pillow
export DISPLAY=:99.0
export LD_LIBRARY_PATH=/usr/lib
echo "torch"
python3 -m pip install numpy
echo "torch2"
python3 -m pip install numpy --only-binary=:all:
echo "torch3"
python3 setup.py install
python3 -c "import numpy as np;from PIL import Image;from PIL import ImageTk;import tkinter;root = tkinter.Tk();example_image_array = np.full((100,100), 123, dtype=np.uint8);example_image = Image.fromarray(example_image_array);example_image_tk = ImageTk.PhotoImage(image=example_image)"
