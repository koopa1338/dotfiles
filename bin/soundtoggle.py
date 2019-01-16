#!/bin/python
import os
import subprocess
sound = str(subprocess
        .check_output("pactl info | grep alsa_output | awk '{print $2}'", shell=True))
sound = sound.split(".")[3]
output = sound.split("-")[0]
if output == "analog":
    os.system("pactl set-default-sink 0")
else:
    os.system("pactl set-default-sink 1")
os.system("polybar_launch")
