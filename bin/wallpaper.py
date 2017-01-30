#!/usr/bin/env python

import glob
import random
import os
import time
while True:
    files = glob.glob("/home/koopa/Wallpaper/*.jpeg")
    random.shuffle(files)
    command = "feh --bg-scale " + files[0] + " --bg-scale " + files[1]
    os.system(command)
    time.sleep(1800)
