#!/bin/bash

cleanup()
{
    if [ -f ~/.bashrc.dotapps.tmp ]; then
        rm ~/.bashrc.dotapps.tmp
    fi
    exit 0
}

trap 'cleanup' 0

