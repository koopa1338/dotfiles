#!/bin/bash
qt5ct="QT_QPA_PLATFORMTHEME=qt5ct"
qtcurr=$(cat /etc/environment | grep 'QT_QPA_PLATFORMTHEME')
#echo $qtcurr
if [[ $qtcurr == "QT_QPA_PLATFORMTHEME=qt5ct" ]]; then
  echo "QT_QPA_PLATFORMTHEME is already set"
else
  sudo bash -c "echo $qt5ct >> /etc/environment"
fi
