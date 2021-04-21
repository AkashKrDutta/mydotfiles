#! /bin/bash

source "$DOTAPPS_HOME/helpers/trap.sh"
source "$DOTAPPS_HOME/helpers/helper.sh"

# Config
link="https://github.com/sindresorhus/pure.git"
download_path="$PURE_PROMPT_PATH"

print_header "Installing pure"

mkdir -p $download_path

git clone $link "$download_path/pure"
echo "fpath+=\"$download_path/pure\"" >> ~/$ZDOTDIR/.zshrc
cat <<'EOF' >> ~/$ZDOTDIR/.zshrc
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:fetch only_upstream yes
zstyle ':prompt:pure:prompt:success' color blue
zstyle ':prompt:pure:prompt:error' color red
PURE_CMD_MAX_EXEC_TIME=60
#PURE_PROMPT_SYMBOL='➤'
PURE_PROMPT_SYMBOL='⤷'
EOF

print_footer "Done"

source "$DOTAPPS_HOME/helpers/untrap.sh"
