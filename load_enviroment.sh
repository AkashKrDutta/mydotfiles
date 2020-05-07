#! /bin/bash

DOTAPPS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DOTAPPS_HOME/config.sh"

# Setup enviroment for installing the apps
export INSTALL_DIRECTORY="$INSTALL_DIRECTORY"
export PATH="$INSTALL_DIRECTORY/local/bin":$PATH
export LD_LIBRARY_PATH="$INSTALL_DIRECTORY/local/lib":$LD_LIBRARY_PATH
export CPPFLAGS="-I$INSTALL_DIRECTORY/local/include"
export LDFLAGS="-L$INSTALL_DIRECTORY/local/lib"

# Log file for errors
LOG_FILE="$DOTAPPS_HOME/debug.log"

# file structure information
APPS_DIRECTORY="$INSTALL_DIRECTORY/apps"
INSTALL_PATH="$INSTALL_DIRECTORY/local"
DOT_DIRECTORY="$INSTALL_DIRECTORY/dotfiles"
ZDOTDIR="$DOT_DIRECTORY/zsh"
OHMYZSH_DOWNLOAD_PATH="$DOT_DIRECTORY/oh-my-zsh"
