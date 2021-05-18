# Yet another Dot Files!

![Nord BSPWM](https://github.com/AkashKrDutta/mydotfiles/blob/master/images/nord-ss-1.png)

I started off with automating installation of zsh, ncurses, oh-my-zsh, gnome-terminal. The basic stuff are in place, eg: zsh, ncurses, oh-my-zsh, 7za etc. Mostly the stuff we need whenever distro hopping/working on new env. I like to have my applications builded manually and installed in home folders if possible. 

Apart from the installables, this is also a dot files repo (well, obviously!). The dot files are present specifically in the .config (corresponding to $HOME/.config files) and rc_config dir (corresponding to $HOME rc files). You will need to edit some configs in order to get the themes working (having a basic idea of bspwm or polybar / rofi should be enough)
Thus, there are two parts to this project.
1. Install apps WITHOUT SUDO. (pretty much ignorable, although helps me really to get basic stuff in place like zsh, oh-my-zsh and gnome-terminal)
2. dotfiles in .config and rc_confgs (yeah, the actual dot files)

## Install apps WITHOUT SUDO.

Installed files are kept in a custom directory except changes made to ~/.bashrc and ~/.local/share/fonts etc.
Edit `config.sh` to configure install directory.

### How to Install

1. `$ source create_env.sh` : creates env
1. `$ init` : sets up PATH and other vars in bashrc
1. Use functions to install apps:
    1. `install_7zip` : Will install [p7zip](https://www.7-zip.org/download.html), used to install other apps.
    2. `install_ncurses` : Dependancy for zsh installation.
    3. `install_zsh` : Vanila zsh installation.
    4. `install_oh_my_zsh`
    5. `install_pure_prompt` : Install [pure prompt](https://github.com/sindresorhus/pure)
    6. `install_config_gnome_terminal` :  Install Dracula gnome theme with Hack Fonts. **Beware**: Your current gnome terminal profiles will be lost. Learn how to backup [here](https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile).

### Troubleshoot

1. gcc-10 build fails for 7za: [bug](https://sourceforge.net/p/p7zip/bugs/226/). Use a previous version of gcc.


### Distribution Supported
* Debian based distros (Ubuntu) (Can be used with any distro with minor changes)

## Configs and RCs
App configs are present in .config dir, while the home directory rc files are present in rc_configs dir. There are some automation scripts useful for polybar, battery-notification I wrote present in conf.d directory. Feel free to edit and use them too.

### TODO
9. Install tmux and edit theme as in vim.
11. Low Battery dunst notification.


## Themes used:
1. Gnome-terminal, vim from https://www.nordtheme.com/ports
2. Polybar shapes [theme](https://github.com/adi1090x/polybar-themes) edited to be suitable for nord theme.
3. Firefox theme : https://addons.mozilla.org/en-US/firefox/addon/kristofferhagen-nord-theme
