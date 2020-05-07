# Install apps and their dotfile configs without sudo

The only file changed is ~/.bashrc (and config files that a user can edit without sudo). Apps installation occur in custom directories using source code. Useful when moving to new enviroment.

## Pre Installations
Change configs present in `config.sh` according to your needs.

## Order of Installations
Recommended order of app installation -

1. 7za
1. zsh (ncurses might be dependancy)
1. oh-my-zsh
1. gnome-terminal (themes)

## Post Installations
Run `finish.sh` to complete the installation.

## Distribution Supported
* Debian

Will attach screenshots [WIP]
