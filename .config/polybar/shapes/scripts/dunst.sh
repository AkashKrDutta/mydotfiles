#!/usr/bin/env bash
newNotificationCount="$(dunstctl count history)"
if [[ $newNotificationCount > 0 ]];then
    echo "%{B#a3be8c} %{F#2e3440}$newNotificationCount%{F-} %{B-}"
else
    echo "%{F#88c0d0}None%{F-}"
fi
