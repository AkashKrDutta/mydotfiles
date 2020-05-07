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

# zsh dotfile directory that zsh will recognize
echo "export ZDOTDIR=\"$ZDOTDIR\"" >> ~/.bashrc
mkdir -p $ZDOTDIR
if [ -f $ZDOTDIR/.zshrc ]; then
    mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.copy.dotapps_zsh
fi
echo "#Initial comment from zsh automated finish.sh script" > $ZDOTDIR/.zshrc
