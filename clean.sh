#! /bin/bash
# This script removes all changes made
rm -rf $HOME/dotapps/apps
rm /home/akd/.local/share/fonts/MesloGS*
dconf reset -f /org/gnome/terminal/legacy/profiles:/
# Undo bashrc TODO

