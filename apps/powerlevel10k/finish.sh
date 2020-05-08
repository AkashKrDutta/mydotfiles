#! /bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"
source "$DOTAPPS_HOME/helper.sh"

debug_info="\n"$(printf "=%.0s" {1..75})"\n ${BASH_SOURCE[0]} : "$(date)"\n""$(printf "=%.0s" {1..75})"
echo -e $debug_info >> $LOG_FILE

# Put powerlevel10k config to source on zshrc
echo -e "\n#Config variables for custom apps installed via script">> $ZDOTDIR/.zshrc
cat << EOF >> $ZDOTDIR/.zshrc
[[ ! -f $POWERLEVEL10K_PATH/.p10k.zsh ]] || source $POWERLEVEL10K_PATH/.p10k.zsh
EOF
