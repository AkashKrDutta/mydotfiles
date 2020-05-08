## This uses dconf to manage gnome profile
Check if dconf is installed or not. I had it installed in my vanila debian hence did not provid in dependancy directory.

Warning your current profiles will be overwritten. Make a backup, know how - https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile

Some info around dconf:

* Dconf is one of the main configuration utilities in GNOME. Its purpose is to help you set and manage GNOME system and application settings.
* To give you an idea of the power of dconf within GNOME, a dconf key exists for most every setting that a user can click on in the GNOME desktop or in any GNOME application. In addition to this, there are some system and application settings that cannot even be changed from within the user interface, but which can be changed by using dconf.
* As an administrator, this means that knowing how to use dconf will help you to customize GNOME and GNOME-based applications to best suit the needs of your particular environment.
* Users can override the customized defaults with their own settings, unless the administrator locks these defaults to prevent overriding.


<ins>Note</ins> - This color scheme has been taken from : https://github.com/dracula/gnome-terminal

## Installation Steps

1. Run `install.sh`
1. If `install.sh` fails for some reason, inspect the `debug.log` and install the relevant dependancy present in the dependancy root directory.
1. Run `finish.sh`

