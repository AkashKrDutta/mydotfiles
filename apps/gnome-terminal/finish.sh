#! /bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"

# Put eval in zshrc
echo -e "\n#Config variables for custom apps installed via script">> $ZDOTDIR/.zshrc
echo 'eval `dircolors '"$DRACULA_SOLARIZED_PATH/dircolors"'`' >> $ZDOTDIR/.zshrc

