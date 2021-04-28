#! /bin/bash
# This script removes all changes made
rm -rf $HOME/dotapps/apps
# remove font 
rm $HOME/.local/share/fonts/Hack*
# remove profile changes
dconf reset -f /org/gnome/terminal/legacy/profiles:/
# Undo bashrc
if [ -f ~/.bashrc ] && [ ! -f ~/.bashrc.dotapps.orig ]; then
    mv ~/.bashrc.dotapps.orig ~/.bashrc
fi
