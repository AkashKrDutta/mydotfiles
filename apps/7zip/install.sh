#! /bin/bash

source "$DOTAPPS_HOME/helpers/trap.sh"
source "$DOTAPPS_HOME/helpers/helper.sh"

# Config
version="16.02"
link="https://nchc.dl.sourceforge.net/project/p7zip/p7zip/${version}/p7zip_${version}_src_all.tar.bz2"
download_path="$APPS_DIRECTORY/7zip"
tar_ball=$download_path/7zip-$version.tar.xz
extract_path="$download_path/p7zip_$version"

print_header "Installing 7zip"

mkdir -p "$download_path"

if [ ! -f $tar_ball ]; then
    print_subheader "Downloading 7zip"
    curl -o "$tar_ball" -L "$link" 1>&2
else
    print_subheader "Found 7zip tarball, skipping download..."
fi

print_subheader "Extracting 7zip"
tar -xjvf $tar_ball -C $download_path 1>&2

print_subheader "Make in progress"
make -C $extract_path 1>&2

print_subheader "Make install in progress"
sed -i "s|DEST_HOME=.*|DEST_HOME=$INSTALL_PATH|" "$extract_path/makefile.common"
make install -C $extract_path 1>&2
print_footer "Done"

source "$DOTAPPS_HOME/helpers/untrap.sh"
