# Install apps and their dotfile configs without sudo

All files are kept in a custom directory except changes made to ~/.bashrc and ~/.local/share/fonts etc (config files which can be changed withou sudo). Useful when moving to new enviroment.

## Pre Installations
Change configs present in `config.sh` according to your needs.

## Order of Installations
Recommended order of app installation -

1. 7za --> important since following depend on this
1. zsh (ncurses might be dependancy)
1. oh-my-zsh
1. dracula-gnome-terminal
1. powerlevel10k

## Post Installations
Run `finish.sh` to complete the installation.

## Distribution Supported
* Ubuntu

Will attach screenshots [WIP]
