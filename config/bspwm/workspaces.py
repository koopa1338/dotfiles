#!/usr/bin/env python
from screeninfo import get_monitors
import os

ws_names = ["一", "ニ", "三", "四", "五", "六", "七", "八", "九", "十"]
subscript = str.maketrans("0123456789", "⁰¹²³⁴⁵⁶⁷⁸⁹")


def set_monitor_workspaces():
    for i, m in enumerate(get_monitors()):
        pre = ""
        if not m.is_primary:
            pre += f"数{i}".translate(subscript)
        name = m.name if "." not in m.name else f"%{m.name}"
        cmd = f"bspc monitor {name} -d"
        for ws in ws_names:
            cmd += f" {pre}{ws}"
        os.system(cmd)


if __name__ == '__main__':
    set_monitor_workspaces()
