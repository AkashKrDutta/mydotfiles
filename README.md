## Install apps and their dotfile configs without sudo

The only file changed is ~/.bashrc, apps installation occur in custom directory. Useful when changing systems, moving to new enviroment. All apps are installed from source. Distribution: Debian.

Steps for installation for any app -

1. Change configs present in config.sh according to your needs.
2. Run install.sh
3. If install.sh fails for some reason, inspect the debug.log and install the relevant dependancy present in the dependancy folder.
3. Run the finish.sh to complete setup.

Will attach screenshots [WIP]
