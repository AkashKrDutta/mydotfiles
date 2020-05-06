#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done

source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"

mkdir -p $INSTALL_DIRECTORY

# Log file for errors
LOG_FILE="$DOTAPPS_HOME/debug.log"

# file structure information
APPS_DIRECTORY="$INSTALL_DIRECTORY/apps"
INSTALL_PATH="$INSTALL_DIRECTORY/local"

# create the file structure
mkdir -p $APPS_DIRECTORY 
mkdir -p $INSTALL_PATH 

echo "NOTE: Any verbose output will be hidden and their output redirected to error.logs in case anything goes wrong"
# Install ZSH
install_zsh() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing zsh"
    ZSH_DOWNLOAD_PATH="$APPS_DIRECTORY/zsh"
    mkdir -p $ZSH_DOWNLOAD_PATH
    ZSH_VERSION="5.8"
    ZSH_LINK="https://sourceforge.net/projects/zsh/files/zsh/$ZSH_VERSION/zsh-$ZSH_VERSION.tar.xz/download"
    ZSH_TAR_BALL=$ZSH_DOWNLOAD_PATH/zsh-$ZSH_VERSION.tar.xz
    if [ ! -f $ZSH_TAR_BALL ]; then
        print_subheader "Downloading zsh"
        output=$(curl --silent -f -o $ZSH_TAR_BALL -L $ZSH_LINK &>> "$LOG_FILE")
        if [[ $? == 22 ]]; then
            echo "$GLOBAL_DASHES"
            echo "Failed downloading zsh: link - $ZSH_LINK"
            echo "Aborting ncurses install, check errors.log for details"
            return
        fi
        print_done
    else
	print_subheader "Found zsh tarball, skipping download..."
    fi

    print_subheader "Extracting zsh"
    tar -xJvf $ZSH_TAR_BALL -C $ZSH_DOWNLOAD_PATH &>> "$LOG_FILE"
    print_done
    print_subheader "Installing zsh"
}



install_zsh
#print_header "INSTALLING OH-MY-ZSH"
#print_subheader "DOWNLOADING OH-MY-ZSH"
