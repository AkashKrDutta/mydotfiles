#! /bin/bash

export display1="eDP-1"
export display2="HDMI-2"
export externalMonitor=$(xrandr -q | grep " connected" | grep -E "$display2")

