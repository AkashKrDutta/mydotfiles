#! /bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helpers/helper.sh"
# create the file structure
mkdir -p $APPS_DIRECTORY 
mkdir -p $INSTALL_PATH 
mkdir -p $DOT_DIRECTORY 


debug_info="\n"$(printf "=%.0s" {1..75})"\n ${BASH_SOURCE[0]} : "$(date)"\n""$(printf "=%.0s" {1..75})"
echo -e $debug_info >> $LOG_FILE

install_vim() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing vim"
    VIM_DOWNLOAD_PATH="$APPS_DIRECTORY/vim"
    mkdir -p $VIM_DOWNLOAD_PATH
    VIM_VERSION="5.8"
    VIM_LINK="https://sourceforge.net/projects/vim/files/vim/$VIM_VERSION/vim-$VIM_VERSION.tar.xz/download"
    VIM_TAR_BALL=$VIM_DOWNLOAD_PATH/vim-$VIM_VERSION.tar.xz
    if [ ! -f $VIM_TAR_BALL ]; then
        print_subheader "Downloading vim"
	error_checked_curl "$VIM_TAR_BALL" "$VIM_LINK" "$LOG_FILE"
	ret=$?
        if [[ $ret != 0 ]];then return 1; fi
    else
	print_subheader "Found vim tarball, skipping download..."
    fi

    print_subheader "Extracting vim"
    error_checked_unzip "$VIM_TAR_BALL" "$VIM_DOWNLOAD_PATH" "$LOG_FILE"
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done

    VIM_EXTRACT="$VIM_DOWNLOAD_PATH/vim-$VIM_VERSION"

    print_subheader "Configuring vim"
    # env variables used by make to create shared libarries
    # export CXXFLAGS=" -fPIC"
    # export CFLAGS=" -fPIC"
    # configure uses --enable-shared to create shared libararies
    output=$(cd $VIM_EXTRACT && ./configure --enable-shared --prefix="$INSTALL_PATH" &>> "$LOG_FILE")
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done

    print_subheader "Make in progress"
    make -C $VIM_EXTRACT &>> "$LOG_FILE"
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done

    print_subheader "Make Install in progress"
    make install -C $VIM_EXTRACT &>> "$LOG_FILE"
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi
    print_done

    return 0
}

install_vim
ret=$?
print_completion $ret
