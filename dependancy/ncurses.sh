#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done

source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"

# Log file for errors
LOG_FILE="$DOTAPPS_HOME/debug.log"

# file structure information
APPS_DIRECTORY="$INSTALL_DIRECTORY/apps"
INSTALL_PATH="$INSTALL_DIRECTORY/local"

# Install ncurses
install_ncurses() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing ncurses"
    NCURSES_DOWNLOAD_PATH="$APPS_DIRECTORY/ncurses"
    mkdir -p $NCURSES_DOWNLOAD_PATH
    NCURSES_VERSION="6.2"
    NCURSES_LINK="https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz"
    NCURSES_TAR_BALL=$NCURSES_DOWNLOAD_PATH/ncurses-$NCURSES_VERSION.tar.gz
    if [ ! -f $NCURSES_TAR_BALL ]; then
        print_subheader "Downloading ncurses"
        output=$( curl -f https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz -o $NCURSES_TAR_BALL &>> $LOG_FILE)
        if [[ $? == 22 ]]; then
            echo "$GLOBAL_DASHES"
            echo "Failed downloading ncurses: link - $NCURSES_LINK"
            echo "Aborting ncurses install, check errors.log for details"
            return
        fi
        print_done
    else
	print_subheader "Found ncurses tarball, skipping download..."
    fi
    print_subheader "Extracting ncurses"
    tar -xzf $NCURSES_TAR_BALL -C $NCURSES_DOWNLOAD_PATH
    print_done
    print_subheader "Installing ncurses"
}

install_ncurses
