#! /bin/bash

# Directory where apps will be installed (make install)

# Recommended to install in /usr/local so that root user is also able to find these packages in your personal machine
# Use a $HOME/.local for a machine where root access is not possible
INSTALL_DIRECTORY="/usr/local"

# Directory where apps will be downloaded, dotfiles kept and compiled (make)
BUILD_DIRECTORY="$HOME/apps"
