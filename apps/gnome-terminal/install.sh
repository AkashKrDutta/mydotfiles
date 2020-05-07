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

install_dracula_solarized() {
    CURRENT_HEADER_SEQUENCE=$(($CURRENT_HEADER_SEQUENCE + 1))
    print_header "Installing dracula_solarized"
    mkdir -p $DRACULA_SOLARIZED_PATH

    # Install solarized ls outputs
    print_subheader "Installing ls solarized colors"
    cp $DOTAPPS_HOME/apps/gnome-terminal/dircolors $DRACULA_SOLARIZED_PATH
    print_done


    # Code to find gnome version and sets the tool accordingly
    print_subheader "Installing gnome-terminal dracula profile"
    cp $DOTAPPS_HOME/apps/gnome-terminal/dracula-solarized-gnome-terminal-profile.dconf $DRACULA_SOLARIZED_PATH
    gnomeVersion="$(expr \
        "$(LANGUAGE=en_US.UTF-8 gnome-terminal --version)" : \
        '^[^[:digit:]]* \(\([[:digit:]]*\.*\)*\)' \
    )"
    
    # newGnome=1 if the gnome-terminal version >= 3.8
    if [[ ("$(echo "$gnomeVersion" | cut -d"." -f1)" = "3" && \
           "$(echo "$gnomeVersion" | cut -d"." -f2)" -ge 8) || \
           "$(echo "$gnomeVersion" | cut -d"." -f1)" -ge 4 ]]; then
        dconfdir=/org/gnome/terminal/legacy/profiles:
    else
        echo "Gnome version older than 3.8. Cannot use dconf. Abort" >> $LOG_FILE
	return 1
    fi

    dconf load "$dconfdir"/ < $DRACULA_SOLARIZED_PATH/dracula-solarized-gnome-terminal-profile.dconf &>> $LOG_FILE
    ret=$?
    if [[ $ret != 0 ]];then return 1; fi

    print_done
    return 0
}

install_dracula_solarized
ret=$?
print_completion $ret
