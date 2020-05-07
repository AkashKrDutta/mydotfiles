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

install_ohmyzsh_plugins() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing oh-my-zsh plugins"
    export ZSH_CUSTOM="$OHMYZSH_DOWNLOAD_PATH/custom"
    mkdir -p $ZSH_CUSTOM
    # Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
    # Install zsh-sytax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
    print_done
    return 0
}

install_ohmyzsh_plugins
ret=$?
print_completion $ret
