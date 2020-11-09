#!/bin/bash

source "$DOTAPPS_HOME/trap.sh"
source "$DOTAPPS_HOME/helper.sh"

version="6.2"
link="https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$version.tar.gz"
download_path="$APPS_DIRECTORY/ncurses"
tar_ball=$download_path/ncurses-$version.tar.gz
extract_path="$download_path/ncurses-$version"

print_header "Installing ncurses"

mkdir -p $download_path

if [ ! -f $tar_ball ]; then
    print_subheader "Downloading ncurses"
    curl -o "$tar_ball" -L "$link" 1>&2
else
    print_subheader "Found ncurses tarball, skipping download..."
fi

print_subheader "Extracting ncurses"
unzip_helper "$tar_ball" "$download_path"

print_subheader "Configuring ncurses"
# env variables used by make and configure to create shared libarries
# fPIC option required for Position Independent Code
export CXXFLAGS=" -fPIC"
export CFLAGS=" -fPIC"
# configure uses --enable-shared to create shared libararies
output=$(cd $extract_path && ./configure --with-shared --prefix="$INSTALL_PATH" 1>&2)

print_subheader "Make in progress"
# now make 
make -C $extract_path 1>&2

print_subheader "Make Install in progress"
# make install to copy bin, lib, includes
make install -C $extract_path 1>&2

print_footer "Done"

source "$DOTAPPS_HOME/untrap.sh"
