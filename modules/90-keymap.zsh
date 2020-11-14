# history substring search
if [ -e "${ZDOTDIR}/init.d/71-history-substring-search.zsh" ]; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
    bindkey -M vicmd '^P' history-substring-search-up
    bindkey -M vicmd '^N' history-substring-search-down
fi

# navigate completion menu with vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# fix backspace key
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1

# misc.
bindkey -M vicmd v edit-command-line
bindkey '^A' autosuggest-accept
bindkey '^Z' fancy-ctrl-z
bindkey ' ' magic-space
