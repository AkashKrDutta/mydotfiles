## Install apps and their dotfile configs without sudo

The only file changed is ~/.bashrc (and config files that a user can edit without sudo). Apps installation occur in custom directories using source code. Useful when moving to new enviroment.

Distribution: Debian

Steps for installing any app -

1. Run install.sh
1. If install.sh fails for some reason, inspect the debug.log and install the relevant dependancy present in the dependancy folder.
1. Run the finish.sh to complete setup.

Recommended order of app installation -

1. 7za
1. zsh (ncurses might be dependancy)
1. oh-my-zsh
1. gnome-terminal (themes)

After installing all apps, run `finish.sh` to complete the installation.
Change configs present in `config.sh` according to your needs.

Will attach screenshots [WIP]
