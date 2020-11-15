# Install apps without sudo

Installed files are kept in a custom directory except changes made to ~/.bashrc and ~/.local/share/fonts etc.
You might wannt edit `config.sh` before installing.

## How to Install

1. `$ source create_env.sh` : creates env
1. `$ init` : sets up PATH and other vars in bashrc
1. Use functions `install_7zip`, `install_zsh` etc to install apps. Some dependancy are also covered like `install_ncurses` for zsh.

## Order of installation
Recommended order:

1. 7za: Must install at first. Other installation depend on this as it generalizes decompression be it gzip, bzip etc.
1. zsh (ncurses might be dependancy)
1. oh-my-zsh
1. gnome-terminal: Configs loaded only. Beware: Your current profiles will be lost. Learn how to backup here: https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile


## Distribution Supported
* Ubuntu
