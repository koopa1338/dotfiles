#!/bin/bash
if [ $(synclient -l | grep TapButton1 | awk '{print $3}') == 1 ] ; then
synclient TapButton1=0;
else
synclient TapButton1=1;
fi