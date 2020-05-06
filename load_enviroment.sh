#! /bin/bash
echo 'export PATH="$HOME/dotapps/local/bin":$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="$HOME/dotapps/local/lib":$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export CPPFLAGS="-I$HOME/dotapps/local/include"' >> ~/.bashrc
echo 'export LDFLAGS="-L$HOME/dotapps/local/lib"' >> ~/.bashrc

