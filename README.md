# Install apps without sudo

All files are kept in a custom directory except changes made to ~/.bashrc and ~/.local/share/fonts etc.
You might wannt edit config.sh before installing.

## How to Install
Run `source create_env.sh` which would enable functions : `install_7zip`, `install_zsh` etc. Use these functions to install. Some dependancy are also covered like `install_ncurses` for zsh.

## Order of Installations
Recommended order:

1. 7za: Must install at first. Other installation depend on this as it generalizes decompression be it gzip, bzip etc.
1. zsh (ncurses might be dependancy)
1. oh-my-zsh


## Distribution Supported
* Ubuntu
