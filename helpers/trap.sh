#!/bin/bash

abort()
{
    echo "An error occurred. Aborting!!"
    if [ -f ~/.bashrc.dotapps.tmp ]; then
        echo "Restoring changes done to bashrc..."
        mv ~/.bashrc.dotapps.tmp ~/.bashrc
    fi
    echo "Check debug.log for more info."
    exit 1
}

# Trap exit signal to print error message
trap 'abort' 0

# Send exit signal on error
set -e
