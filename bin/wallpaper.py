#!/usr/bin/env python

import glob
import random
import os


files = glob.glob("/home/koopa/Wallpaper/*.jpg")
random.shuffle(files)
command = "feh --bg-scale " + files[0] + " --bg-scale " + files[1]
os.system(command)
