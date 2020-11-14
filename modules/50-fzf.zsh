source /usr/share/fzf/completion.zsh 2>/dev/null
source /usr/share/fzf/key-bindings.zsh 2>/dev/null

if [ -d /var/lib/relocate ]; then
    export FZF_ALT_C_COMMAND="cat /var/lib/relocate/relocated.db"
    export FZF_CTRL_R_OPTS="--reverse"
fi
