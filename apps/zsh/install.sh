#! /bin/bash

source "$DOTAPPS_HOME/trap.sh"
source "$DOTAPPS_HOME/helper.sh"

# Config
version="5.8"
link="https://sourceforge.net/projects/zsh/files/zsh/$version/zsh-$version.tar.xz/download"
download_path="$APPS_DIRECTORY/zsh"
tar_ball=$download_path/zsh-$version.tar.xz
extract_path="$download_path/zsh-$version"

print_header "Installing zsh"

mkdir -p $download_path

if [ ! -f $tar_ball ]; then
    print_subheader "Downloading zsh"
    curl -o "$tar_ball" -L "$link" 1>&2
else
    print_subheader "Found zsh tarball, skipping download..."
fi

print_subheader "Extracting zsh"
unzip_helper "$tar_ball" "$download_path"

print_subheader "Configuring zsh"
# env variables used by make to create shared libarries
# export CXXFLAGS=" -fPIC"
# export CFLAGS=" -fPIC"
# configure uses --enable-shared to create shared libararies
output=$(cd $extract_path && ./configure --enable-shared --prefix="$INSTALL_PATH" 1>&2)

print_subheader "Make in progress"
make -C $extract_path 1>&2

print_subheader "Make Install in progress"
make install -C $extract_path 1>&2

print_subheader "Configuring bashrc and zshrc"

# Update bashrc to use zsh
# Create a copy of bashrc if run first time to preserve system original bashrc
if [ -f ~/.bashhrc ] && [ ! -f ~/.bashrc.dotapps.orig ]; then
    cp ~/.bashrc ~/.bashrc.dotapps.orig
fi
# Create a tmp copy of bashrc that will be replaced if abort trap is called
if [ -f ~/.bashhrc ]; then
    cp ~/.bashrc ~/.bashrc.dotapps.tmp
fi
# Update bashrc to invoke zsh
echo "export ZDOTDIR=\"$ZDOTDIR\"" >> ~/.bashrc
cat <<'EOF' >> ~/.bashrc
export SHELL=$(which zsh)
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
EOF


mkdir -p $ZDOTDIR
echo "#Initial comment from automated script" > $ZDOTDIR/.zshrc

print_footer "Done"

source "$DOTAPPS_HOME/untrap.sh"

