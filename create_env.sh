#! /bin/bash

# Get the scripts directory
export DOTAPPS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DOTAPPS_HOME/config.sh"

DOTAPPS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Setup enviroment for installing the apps
export INSTALL_DIRECTORY="$INSTALL_DIRECTORY"
export PATH="$INSTALL_DIRECTORY/local/bin":$PATH
export LD_LIBRARY_PATH="$INSTALL_DIRECTORY/local/lib":$LD_LIBRARY_PATH
export CPPFLAGS="-I$INSTALL_DIRECTORY/local/include" export LDFLAGS="-L$INSTALL_DIRECTORY/local/lib"

# Log file for errors
LOG_FILE="$DOTAPPS_HOME/debug.log"

# File structure information
export APPS_DIRECTORY="$INSTALL_DIRECTORY/apps"
export INSTALL_PATH="$INSTALL_DIRECTORY/local"
export DOT_DIRECTORY="$INSTALL_DIRECTORY/dotfiles"

# Create the file structure
mkdir -p $APPS_DIRECTORY 
mkdir -p $INSTALL_PATH 
mkdir -p $DOT_DIRECTORY 

# Dot directories whose files should not be deleted.
# Required for configuring
export ZDOTDIR="$DOT_DIRECTORY/zsh"
export OHMYZSH_DOWNLOAD_PATH="$DOT_DIRECTORY/oh-my-zsh"
export DRACULA_PATH="$DOT_DIRECTORY/gnome-terminal"
export POWERLEVEL10K_PATH="$DOT_DIRECTORY/powerlevel10k"

# This functions makes changes to bash for installing various apps
# Need to run once
init() {
    "$DOTAPPS_HOME/init.sh" 2>> "$LOG_FILE"
}

install_7zip() {
    "$DOTAPPS_HOME/apps/7zip/install.sh" 2>> "$LOG_FILE"
}

install_zsh() {
    "$DOTAPPS_HOME/apps/zsh/install.sh" 2>> "$LOG_FILE"
}

install_oh_my_zsh() {
    "$DOTAPPS_HOME/apps/oh-my-zsh/install.sh" 2>> "$LOG_FILE"
}

install_ncurses() {
    "$DOTAPPS_HOME/dependancy/ncurses/install.sh" 2>> "$LOG_FILE"
}

install_config_gnome_terminal() {
    "$DOTAPPS_HOME/apps/gnome-terminal/install.sh" 2>> "$LOG_FILE"
}
