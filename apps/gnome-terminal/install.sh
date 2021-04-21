#! /bin/bash

source "$DOTAPPS_HOME/helpers/trap.sh"
source "$DOTAPPS_HOME/helpers/helper.sh"

print_header "Installing dracula gnome terminal theme"

gnomeVersion="$(expr \
    "$(LANGUAGE=en_US.UTF-8 gnome-terminal --version)" : \
    '^[^[:digit:]]* \(\([[:digit:]]*\.*\)*\)' \
)"

# Code to find gnome version and sets the tool accordingly
# if the gnome-terminal version >= 3.8
if [[ ("$(echo "$gnomeVersion" | cut -d"." -f1)" = "3" && \
       "$(echo "$gnomeVersion" | cut -d"." -f2)" -ge 8) || \
       "$(echo "$gnomeVersion" | cut -d"." -f1)" -ge 4 ]]; then
    dconfdir=/org/gnome/terminal/legacy/profiles:
else
    echo "Gnome version older than 3.8. Cannot use dconf." 
    exit 0
fi

mkdir -p $DRACULA_PATH

# Install  ls outputs
print_subheader "Installing ls colors"
cp $DOTAPPS_HOME/apps/gnome-terminal/dircolors $DRACULA_PATH


print_subheader "Installing gnome-terminal dracula profile with Inconsolata fonts"
cp $DOTAPPS_HOME/apps/gnome-terminal/fonts/* $HOME/.local/share/fonts/
cp $DOTAPPS_HOME/apps/gnome-terminal/dracula-gnome-terminal-profiles.dconf $DRACULA_PATH

dconf load "$dconfdir"/ < $DRACULA_PATH/dracula-gnome-terminal-profiles.dconf 1>&2

# Put eval in zshrc
echo -e "\n#Config variables for custom apps installed via script">> $ZDOTDIR/.zshrc
echo 'eval `dircolors '"$DRACULA_PATH/dircolors"'`' >> $ZDOTDIR/.zshrc
echo "" >> $ZDOTDIR/.zshrc

print_footer "Done"

source "$DOTAPPS_HOME/helpers/untrap.sh"
