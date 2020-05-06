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


echo "NOTE: Any verbose output will be hidden and their output redirected to debug.log in case anything goes wrong"
debug_info="\n"$(printf "=%.0s" {1..50})"\n New Execution at - "$(date)"\n""$(printf "=%.0s" {1..50})"
echo -e $debug_info >> $LOG_FILE

# Install 7zip
$DOTAPPS_HOME/apps/7zip.sh

# Install ZSH
$DOTAPPS_HOME/apps/zsh.sh

