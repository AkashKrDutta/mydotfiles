#! /bin/bash

export DOTAPPS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DOTAPPS_HOME/config.sh"

# Setup enviroment for installing the apps
export INSTALL_DIRECTORY="$INSTALL_DIRECTORY"
export PATH="$INSTALL_DIRECTORY/local/bin":$PATH
export LD_LIBRARY_PATH="$INSTALL_DIRECTORY/local/lib":$LD_LIBRARY_PATH
export CPPFLAGS="-I$INSTALL_DIRECTORY/local/include"
export LDFLAGS="-L$INSTALL_DIRECTORY/local/lib"

