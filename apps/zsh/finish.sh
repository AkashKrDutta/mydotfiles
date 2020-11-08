#! /bin/bash

if [ -f ~/.bashhrc ] && [ ! -f ~/.bashrc.dotapps.copy ]; then
    cp ~/.bashrc ~/.bashrc.dotapps.copy
fi

echo "export ZDOTDIR=\"$ZDOTDIR\"" >> ~/.bashrc

mkdir -p $ZDOTDIR
if [ -f $ZDOTDIR/.zshrc ]; then
    mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.dotapps.copy
fi
echo "#Initial comment from zsh automated finish.sh" > $ZDOTDIR/.zshrc
