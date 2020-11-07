#! /bin/bash

source "$DOTAPPS_HOME/app_install_abort.sh"
source "$DOTAPPS_HOME/helper.sh"

# Config
version="16.02"
link="https://nchc.dl.sourceforge.net/project/p7zip/p7zip/${version}/p7zip_${version}_src_all.tar.bz2"
download_path="$APPS_DIRECTORY/7zip"
extract_path="$download_path/p7zip_$version"
tar_ball=$download_path/7zip-$version.tar.xz

print_header "Installing 7zip"

mkdir -p "$download_path"

if [ ! -f $tar_ball ]; then
    print_header "Downloading 7zip"
    curl -o "$tar_ball" -L "$link"
else
    print_header "Found 7zip tarball, skipping download..."
fi

print_header "Extracting 7zip"
tar -xjvf $tar_ball -C $download_path 

print_header "Make in progress"
make -C $extract_path 

print_header "Make install in progress"
sed -i "s|DEST_HOME=.*|DEST_HOME=$INSTALL_PATH|" "$extract_path/makefile.common"
make install -C $extract_path 
print_completion
