#! /bin/bash

CURRENT_SEQUENCE=0

GLOBAL_DASHES="-----"
# meta functions
print_header() {
    to_print="--> $1"
    string_length=${#to_print}
    DASHES=""
    for i in $(seq $string_length)
    do
        DASHES=$DASHES"-" 
    done
    echo -e "$DASHES\n$to_print\n$DASHES"
    CURRENT_SEQUENCE=0
}

print_subheader() {
    CURRENT_SEQUENCE=$(($CURRENT_SEQUENCE + 1))
    to_print="$CURRENT_SEQUENCE. $1"
    string_length=${#to_print}
    DASHES=""
    for i in $(seq $string_length)
    do
        DASHES=$DASHES"-" 
    done
    echo -e "\t$to_print\n\t$DASHES"
}

print_tabbed(){
    echo -e "\t$1"
}

# create file structure
mkdir -p "$HOME/dotapps"
APPS_DIRECTORY="$HOME/dotapps/apps"
BIN="$HOME/dotapps/bin"

mkdir -p $APPS_DIRECTORY 

# Install ZSH
install_zsh() {
    print_header "INSTALLING ZSH"
    ZSH_DOWNLOAD_PATH="$APPS_DIRECTORY/zsh"
    mkdir -p $ZSH_DOWNLOAD_PATH
    ZSH_VERSION="5.8"
    ZSH_LINK="https://sourceforge.net/projects/zsh/files/zsh/$ZSH_VERSION/zsh-$ZSH_VERSION.tar.xz/download"
    print_subheader "DOWNLOADING ZSH"
    output=$(curl --silent -f -o $ZSH_DOWNLOAD_PATH/zsh-$ZSH_VERSION.tar.xz -L $ZSH_LINK)
    if [[ $? == 22 ]]; then
        print_tabbed "$GLOBAL_DASHES"
        print_tabbed "Failed Downloading ZSH: Link - $ZSH_LINK"
	print_tabbed "Aborting ZSH install"
	return
    fi
    print_tabbed "DONE"
    print_tabbed 
    print_subheader "EXTRACTING ZSH"
}



install_zsh
#print_header "INSTALLING OH-MY-ZSH"
#print_subheader "DOWNLOADING OH-MY-ZSH"
