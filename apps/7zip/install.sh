#! /bin/bash

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
mkdir -p $DOT_DIRECTORY 


install_7zip() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing 7zip"
    _7ZIP_DOWNLOAD_PATH="$APPS_DIRECTORY/7zip"
    mkdir -p "$_7ZIP_DOWNLOAD_PATH"
    _7ZIP_VERSION="16.02"

    _7ZIP_LINK="https://nchc.dl.sourceforge.net/project/p7zip/p7zip/${_7ZIP_VERSION}/p7zip_${_7ZIP_VERSION}_src_all.tar.bz2"
    _7ZIP_TAR_BALL=$_7ZIP_DOWNLOAD_PATH/7zip-$_7ZIP_VERSION.tar.xz
    if [ ! -f $_7ZIP_TAR_BALL ]; then
        print_subheader "Downloading 7zip"
	error_checked_curl "$_7ZIP_TAR_BALL" "$_7ZIP_LINK" "$LOG_FILE"
        ret=$?
        if [[ $ret != 0 ]];then return 1; fi
    else
	print_subheader "Found 7zip tarball, skipping download..."
    fi

    print_subheader "Extracting 7zip"
    tar -xjvf $_7ZIP_TAR_BALL -C $_7ZIP_DOWNLOAD_PATH &>> "$LOG_FILE"
    if [[ $? != 0 ]]; then
        echo "Failed extracting 7zip: tarball - $_7ZIP_TAR_BALL"
        echo "Aborting 7zip install, check debug.log for details"
        return 1
    fi
    print_done

    _7ZIP_EXTRACT="$_7ZIP_DOWNLOAD_PATH/p7zip_$_7ZIP_VERSION"

    print_subheader "Make in progress"
    make -C $_7ZIP_EXTRACT &>> "$LOG_FILE"
    print_done

    print_subheader "Make install in progress"
    sed -i "s|DEST_HOME=.*|DEST_HOME=$INSTALL_PATH|" "$_7ZIP_EXTRACT/makefile.common"
    make install -C $_7ZIP_EXTRACT &>> "$LOG_FILE"
    print_done

    return 0
}


install_7zip
ret=$?
print_completion $ret
