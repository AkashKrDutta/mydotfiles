#! /bin/bash

# Get the scripts directory
export DOTAPPS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$DOTAPPS_HOME/config.sh"

DOTAPPS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Setup enviroment for installing the apps
export INSTALL_DIRECTORY="$INSTALL_DIRECTORY"
export BUILD_DIRECTORY="$BUILD_DIRECTORY"

# If its a non-standard install directory need to create links for bin, include, lib
if [[ "$INSTALL_DIRECTORY" != "$HOME/.local" && "$INSTALL_DIRECTORY" != "/usr/local" ]]; then
	export PATH="$INSTALL_DIRECTORY/bin":$PATH
	export LD_LIBRARY_PATH="$INSTALL_DIRECTORY/lib":$LD_LIBRARY_PATH
	export CPPFLAGS="-I$INSTALL_DIRECTORY/include"
	export LDFLAGS="-L$INSTALL_DIRECTORY/lib"
fi

export INSTALL_PATH="$INSTALL_DIRECTORY"

# Log file for errors
LOG_FILE="$DOTAPPS_HOME/debug.log"

# File structure information
export APPS_DIRECTORY="$BUILD_DIRECTORY/apps"
export DOT_DIRECTORY="$BUILD_DIRECTORY/dotfiles"

# Create the file structure
mkdir -p $APPS_DIRECTORY 
mkdir -p $INSTALL_PATH 
mkdir -p $DOT_DIRECTORY 

# Dot directories whose files should not be deleted.
# Required for configuring
export ZDOTDIR="$DOT_DIRECTORY/zsh"
export OHMYZSH_DOWNLOAD_PATH="$APPS_DIRECTORY/oh-my-zsh"
export PURE_PROMPT_PATH="$DOT_DIRECTORY/pure-prompt"

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

install_pure_prompt() {
    "$DOTAPPS_HOME/apps/pure-prompt/install.sh" 2>> "$LOG_FILE"
}
