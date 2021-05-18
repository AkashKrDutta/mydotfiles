#!/usr/bin/env bash
newNotificationCount="$(dunstctl count history)"
if [[ $newNotificationCount > 0 ]];then
    echo "%{B#a3be8c} %{F#ffffff}$newNotificationCount%{F-} %{B-}"
else
    echo "%{F#ffffff}None%{F-}"
fi
