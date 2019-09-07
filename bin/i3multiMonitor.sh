#!/usr/bin/env bash

action="$1"
workspace="$2"

focused_workspace=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused).name')

active_postfix=${focused_workspace: -1}

target_workspace="${workspace} ${active_postfix}"

if [[ "$action" == "move" ]]; 
then
    i3-msg "move container to workspace $target_workspace"
else
    i3-msg "workspace $target_workspace"
fi
