#!/bin/bash

source "$DOTAPPS_HOME/helpers/trap.sh"
source "$DOTAPPS_HOME/helpers/helper.sh"

print_header "Installing.. making changes to bashrc"

# Setup bashrc 

# Create a copy of bashrc if run first time to preserve system original bashrc
if [ -f ~/.bashrc ] && [ ! -f ~/.bashrc.dotapps.orig ]; then
    cp ~/.bashrc ~/.bashrc.dotapps.orig
fi

# Create a tmp copy of bashrc that will be replaced if abort trap is called
cp ~/.bashrc ~/.bashrc.dotapps.tmp
echo -e "\n#Config variables for custom apps installed via script" >> ~/.bashrc
echo 'export PATH='"$INSTALL_PATH/bin"':$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH='"$INSTALL_PATH/lib"':$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export CPPFLAGS='"-I$INSTALL_PATH/include" >> ~/.bashrc
echo 'export LDFLAGS='"-L$INSTALL_PATH/lib" >> ~/.bashrc

print_footer "Done"

source "$DOTAPPS_HOME/helpers/untrap.sh"
