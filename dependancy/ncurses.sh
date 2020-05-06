#!/bin/bash
set -e
source ../helper.sh

# create file structure
APPS_DIRECTORY="$HOME/dotapps/apps"
FINAL_PATH="$HOME/local"

install_ncurses() {
    print_header "Installing ncurses"
    NCURSES_DOWNLOAD_PATH="$APPS_DIRECTORY/ncurses"
    mkdir -p $NCURSES_DOWNLOAD_PATH
    NCURSES_VERSION="6.2"
    NCURSES_LINK="https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz"
    NCURSES_TAR_BALL=$NCURSES_DOWNLOAD_PATH/ncurses-$NCURSES_VERSION.tar.gz
    if [ ! -f $NCURSES_TAR_BALL ]; then
        print_subheader "Downloading ncurses"
        output=$( curl -f --silent https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz -o $NCURSES_TAR_BALL)
        if [[ $? == 22 ]]; then
            print_tabbed "$GLOBAL_DASHES"
            print_tabbed "Failed downloading ncurses: link - $NCURSES_LINK"
            print_tabbed "Aborting ncurses install"
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
