#! /bin/bash
# This script removes all changes made

# Remove only the build files
rm -rf $BUILD_DIRECTORY/apps

# Remove dot files
# Beware dotfiles deleted if were being used will cause issues.
# rm -rf $BUILD_DIRECTORY/dotfiles

# remove font 
rm $HOME/.local/share/fonts/Hack*

# remove profile changes
dconf reset -f /org/gnome/terminal/legacy/profiles:/

# Undo bashrc
if [ -f ~/.bashrc ] && [ ! -f ~/.bashrc.dotapps.orig ]; then
    mv ~/.bashrc.dotapps.orig ~/.bashrc
fi
