#!/usr/bin/env python
from screeninfo import get_monitors
import os

ws_names = ["一", "ニ", "三", "四", "五", "六", "七", "八", "九", "十"]
subscript = str.maketrans("0123456789", "₀₁₂₃₄₅₆₇₈₉")


def set_monitor_workspaces():
    mons = get_monitors()
    mons.sort(key=lambda mon: mon.is_primary, reverse=True)
    return
    for i, m in enumerate(get_monitors()):
        suff = ""
        if not m.is_primary:
            suff = f"{i}".translate(subscript)
        name = m.name if "." not in m.name else f"%{m.name}"
        cmd = f"bspc monitor {name} -d"
        for ws in ws_names:
            cmd += f" {ws}{suff}"
        os.system(cmd)


if __name__ == '__main__':
    set_monitor_workspaces()
