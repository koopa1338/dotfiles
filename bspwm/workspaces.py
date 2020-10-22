#!/bin/python
from screeninfo import get_monitors
import os

def set_monitor_workspaces():
    ws_names = ["一","ニ","三","四","五","六","七","八","九","十"]
    subscript = str.maketrans("0123456789", "⁰¹²³⁴⁵⁶⁷⁸⁹")
    for i, m in enumerate(get_monitors()):
        pre = ""
        if i > 0:
            pre = f"数{i}".translate(subscript)
        cmd = f"bspc monitor {m.name} -d" 
        for ws in ws_names:
            cmd += f" {pre}{ws}"
        os.system(cmd)

if __name__ == '__main__':
    set_monitor_workspaces()
