#! /bin/bash

# Header for all files (they can be run independently)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
while [ ! -f "$SCRIPT_DIR/load_enviroment.sh" ]; do
    SCRIPT_DIR="$( cd "$SCRIPT_DIR/.." > /dev/null 2>&1 && pwd )"
done
source "$SCRIPT_DIR/load_enviroment.sh"

echo -e "\n#Config variables for custom apps installed via script">> ~/.bashrc
echo 'export PATH='"$INSTALL_PATH/bin"':$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH='"$INSTALL_PATH/lib"':$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export CPPFLAGS='"-I$INSTALL_PATH/include" >> ~/.bashrc
echo 'export LDFLAGS='"-L$INSTALL_PATH/lib" >> ~/.bashrc

