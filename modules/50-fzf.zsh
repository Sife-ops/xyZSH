source /usr/share/fzf/completion.zsh 2>/dev/null # Arch
source /usr/share/fzf/key-bindings.zsh 2>/dev/null # Arch
source /usr/share/doc/fzf/examples/key-bindings.zsh 2>/dev/null # Debian

export FZF_CTRL_R_OPTS="--reverse"

if [ -d /var/lib/relocate ]; then
    export FZF_ALT_C_COMMAND="cat /var/lib/relocate/relocated.db"
fi
