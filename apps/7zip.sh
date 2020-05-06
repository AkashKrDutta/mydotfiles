#! /bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"

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
    else
	print_subheader "Found 7zip tarball, skipping download..."
    fi

    print_subheader "Extracting 7zip"
    tar -xjvf $_7ZIP_TAR_BALL -C $_7ZIP_DOWNLOAD_PATH &>> "$LOG_FILE"
    if [[ $? != 0 ]]; then
        echo "Failed extracting 7zip: tarball - $_7ZIP_TAR_BALL"
        echo "Aborting 7zip install, check debug.log for details"
        return
    fi
    print_done
    print_subheader "Installing 7zip"
    make -C ${_7ZIP_DOWNLOAD_PATH}/p7zip_${_7ZIP_VERSION} &>> "$LOG_FILE"
    cp -r ${_7ZIP_DOWNLOAD_PATH}/p7zip_${_7ZIP_VERSION}/bin $INSTALL_PATH
    print_done
}

install_7zip
