#! /bin/bash

source "$DOTAPPS_HOME/trap.sh"
source "$DOTAPPS_HOME/helper.sh"

print_header "Installing oh-my-zsh"
# config variables for oh-my-zsh
export CHSH="no"
export RUNZSH="no"
export KEEP_ZSHRC="yes"
export ZSH="$OHMYZSH_DOWNLOAD_PATH"
OHMYZSH_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
mkdir -p $DOTAPPS_HOME/tmp
curl -Lo "$DOTAPPS_HOME"/tmp/omzshinstall.sh "$OHMYZSH_LINK"
sh "$DOTAPPS_HOME"/tmp/omzshinstall.sh

if [ -f $ZDOTDIR/.zshrc ]; then
    mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.dotapps.copy
fi
sed -i "s|export ZSH=.*|export ZSH=$ZSH|" $APPS_DIRECTORY/oh-my-zsh/zshrc
cp $APPS_DIRECTORY/oh-my-zsh/zshrc $ZDOTDIR/.zshrc

# Install some basic plugins
print_subheader "Installing oh-my-zsh plugins"
export ZSH_CUSTOM="$OHMYZSH_DOWNLOAD_PATH/custom"
mkdir -p $ZSH_CUSTOM
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
# Install zsh-sytax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

print_footer "Done"

source "$DOTAPPS_HOME/untrap.sh"
