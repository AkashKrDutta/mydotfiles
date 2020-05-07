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


debug_info="\n"$(printf "=%.0s" {1..75})"\n ${BASH_SOURCE[0]} : "$(date)"\n""$(printf "=%.0s" {1..75})"
echo -e $debug_info >> $LOG_FILE

install_oh-my-zsh() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing oh-my-zsh"
    #mkdir -p $OHMYZSH_DOWNLOAD_PATH
    # config variables for oh-my-zsh
    export CHSH="no"
    export RUNZSH="no"
    export KEEP_ZSHRC="yes"
    export ZSH="$OHMYZSH_DOWNLOAD_PATH"
    OHMYZSH_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    mkdir -p $DOTAPPS_HOME/tmp
    curl -Lo "$DOTAPPS_HOME"/tmp/omzshinstall.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh "$DOTAPPS_HOME"/tmp/omzshinstall.sh
    ret=$?
    if [[ $ret != 0 ]]; then
        return 1
    fi
    if [ -f $ZDOTDIR/.zshrc ]; then
        mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.copy.dotapps_ohmyzsh
    fi
    sed -i "s|export ZSH=.*|export ZSH=$ZSH|" $DOTAPPS_HOME/apps/oh-my-zsh/zshrc
    cp $DOTAPPS_HOME/apps/oh-my-zsh/zshrc $ZDOTDIR/.zshrc
    print_done
    return 0
}

install_oh-my-zsh
ret=$?
print_completion $ret
