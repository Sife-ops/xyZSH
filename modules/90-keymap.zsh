function isfunction {
    # test whether function is defined
    if type $1 | grep -q 'is a shell function' 2>/dev/null; then
        true
    else
        false
    fi
}

# fix backspace key
bindkey -v '^?' backward-delete-char

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
