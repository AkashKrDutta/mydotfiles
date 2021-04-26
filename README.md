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
1. ~~Notification using https://github.com/dunst-project/dunst, with dracula theme https://draculatheme.com/dunst.~~
2. ~~Update package notification using dunst.~~
3. ~~Wifi~~, sound and brightness clickable and notify using dunst. (update: Wifi config for dmenu_networkmanager added, and package wicd installed).
4. ~~A light weight file manager other than nautilus.~~ (nautilus seems to work fine for now)
5. ~~Removing default gtk based color fingerprint in bspwm window.~~ (update: lxappearance to the rescue, with dracula gtk theme: https://draculatheme.com/gtk!)
6. ~~Add calendar support on clicking to date.~~ (update: added polybar action to open gnome-calendar)
7. ~~Change system wide fonts to that of polybar.~~ (update: lxappearance does that too in widget them section to Iosevka)
8. Add colorls and use dracula theme. https://github.com/athityakumar/colorls
9. Edit dracula them for vim. 
10. Install tmux and edit theme as in vim.
11. ~~Add rofi dracula theme from dracule bspwm theme: https://draculatheme.com/bspwm~~


## Themes used:
1. GTK, firefox, gnome-terminal, bspwm etc, all taken from dracula with minor changes wherever needed. https://draculatheme.com/
2. Polybar shapes theme edited for dracula 
