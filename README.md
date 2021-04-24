# Yet another Dot Files!

![Polybar](https://github.com/AkashKrDutta/mydotfiles/blob/master/extra/ss-1.png)
![BSPWM](https://github.com/AkashKrDutta/mydotfiles/blob/master/extra/ss-2.png)
![Multi Monitor BSPWM](https://github.com/AkashKrDutta/mydotfiles/blob/master/extra/ss-3.png)

I started off with automating installation of zsh, ncurses, oh-my-zsh, gnome-terminal. While basic stuff is in place, some dot files are present specifically in the .config dir as well. 
There are two parts to this project.
1. Install apps WITHOUT SUDO.
2. dotfiles in .config dir

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
* Debian based distros (Ubuntu).

## Configs and RCs
App configs are present in .config dir, while the home directory rc files are present in rc_configs dir

### TODO
1. Notification using https://github.com/dunst-project/dunst.
2. Update package notification using dunst.
3. ~~Wifi~~, sound and brightness clickable. (update: Wifi config for dmenu_networkmanager added)
4. A light weight file manager other than nautilus.
5. Removing default gtk based color fingerprint in bspwm window.
6. Add calendar support on clicking to date.
