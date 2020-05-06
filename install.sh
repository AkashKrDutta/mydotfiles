#! /bin/bash
source helper.sh

# create file structure
mkdir -p "$HOME/dotapps"
APPS_DIRECTORY="$HOME/dotapps/apps"
FINAL_PATH="$HOME/dotapps/local"

mkdir -p $APPS_DIRECTORY 

# Install ZSH
install_zsh() {
    print_header "Installing zsh"
    ZSH_DOWNLOAD_PATH="$APPS_DIRECTORY/zsh"
    mkdir -p $ZSH_DOWNLOAD_PATH
    ZSH_VERSION="5.8"
    ZSH_LINK="https://sourceforge.net/projects/zsh/files/zsh/$ZSH_VERSION/zsh-$ZSH_VERSION.tar.xz/download"
    ZSH_TAR_BALL=$ZSH_DOWNLOAD_PATH/zsh-$ZSH_VERSION.tar.xz
    if [ ! -f $ZSH_TAR_BALL ]; then
        print_subheader "Downloading zsh"
        output=$(curl --silent -f -o $ZSH_TAR_BALL  -L $ZSH_LINK)
        if [[ $? == 22 ]]; then
            print_tabbed "$GLOBAL_DASHES"
            print_tabbed "Failed downloading zsh: link - $ZSH_LINK"
            print_tabbed "Aborting zsh install"
            return
        fi
        print_done
    else
	print_subheader "Found zsh tarball, skipping download..."
    fi

    print_subheader "Extracting zsh"
    tar -xJvf $ZSH_TAR_BALL -C $ZSH_DOWNLOAD_PATH
    print_done
    print_subheader "Installing zsh"
}



install_zsh
#print_header "INSTALLING OH-MY-ZSH"
#print_subheader "DOWNLOADING OH-MY-ZSH"
