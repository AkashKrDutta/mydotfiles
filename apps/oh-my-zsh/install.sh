#! /bin/bash

source "$DOTAPPS_HOME/helpers/trap.sh"
source "$DOTAPPS_HOME/helpers/helper.sh"

print_header "Installing oh-my-zsh"
# config variables for oh-my-zsh
export CHSH="no"
export RUNZSH="no"
export KEEP_ZSHRC="yes"
export ZSH="$OHMYZSH_DOWNLOAD_PATH"
OHMYZSH_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
mkdir -p $DOTAPPS_HOME/tmp
curl -Lo "$DOTAPPS_HOME"/tmp/omzshinstall.sh "$OHMYZSH_LINK"

# Make copy of zshrc present in home as this would conflict with oh-my-zsh installation
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.dotapps.orig
fi

sh "$DOTAPPS_HOME"/tmp/omzshinstall.sh
rm -r $DOTAPPS_HOME/tmp

if [ -f $ZDOTDIR/.zshrc ]; then
    mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.dotapps.copy
fi
cp $DOTAPPS_HOME/apps/oh-my-zsh/zshrc $ZDOTDIR/.zshrc
sed -i "s|export ZSH=.*|export ZSH=$ZSH|" $DOTAPPS_HOME/apps/oh-my-zsh/zshrc

# Setup man paths
echo -e "\n#Config variables for custom apps installed via script">> $ZDOTDIR/.zshrc
echo 'export MANPATH="'"$INSTALL_PATH/man"'":$MANPATH' >> $ZDOTDIR/.zshrc
echo 'export MANPATH="'"$INSTALL_PATH/share/man"'":$MANPATH' >> $ZDOTDIR/.zshrc

# Install some basic plugins
print_subheader "Installing oh-my-zsh plugins"
export ZSH_CUSTOM="$OHMYZSH_DOWNLOAD_PATH/custom"
mkdir -p $ZSH_CUSTOM
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
# Install zsh-sytax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

echo "" >> $ZDOTDIR/.zshrc

print_footer "Done"

source "$DOTAPPS_HOME/helpers/untrap.sh"
