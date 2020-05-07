#!/bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"
# create the file structure
mkdir -p $APPS_DIRECTORY 
mkdir -p $INSTALL_PATH 


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
        error_checked_curl "$NCURSES_TAR_BALL" "$NCURSES_LINK" "$LOG_FILE"
        ret=$?
        if [[ $ret != 0 ]];then return 1; fi
    else
	print_subheader "Found ncurses tarball, skipping download..."
    fi
    
    print_subheader "Extracting ncurses"
    error_checked_unzip "$NCURSES_TAR_BALL" "$NCURSES_DOWNLOAD_PATH" "$LOG_FILE"
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    
    NCURSES_EXTRACT="$NCURSES_DOWNLOAD_PATH/ncurses-$NCURSES_VERSION"

    print_subheader "Configuring ncurses"
    # env variables used by make and configure to create shared libarries
    export CXXFLAGS=" -fPIC"
    export CFLAGS=" -fPIC"
    # configure uses --enable-shared to create shared libararies
    output=$(cd $NCURSES_EXTRACT && ./configure --enable-shared --prefix="$INSTALL_PATH" &>> "$LOG_FILE")
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done
    
    print_subheader "Make in progress"
    # now make 
    make -C $NCURSES_EXTRACT &>> "$LOG_FILE"
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done
    
    print_subheader "Make Install in progress"
    # make install to copy bin, lib, includes
    make install -C $NCURSES_EXTRACT &>> "$LOG_FILE"
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done
    
    return 0
}


install_ncurses
ret=$?
print_completion $ret
