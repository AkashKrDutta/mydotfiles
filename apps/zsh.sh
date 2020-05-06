#! /bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"

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
	ret=$(error_checked_curl "$ZSH_TAR_BALL" "$ZSH_LINK" "$LOG_FILE")
        if [[ ret != 0 ]];then return; fi
    else
	print_subheader "Found zsh tarball, skipping download..."
    fi

    print_subheader "Extracting zsh"
    ret=$(error_checked_unzip "$ZSH_TAR_BALL" "$ZSH_DOWNLOAD_PATH" "$LOG_FILE")
    if [[ ret != 0 ]];then return; fi
    print_subheader "Installing zsh"
}

install_zsh
