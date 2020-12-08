function isfunction {
    # test whether function is defined
    if type $1 | grep -q 'is a shell function' 2>/dev/null; then
        true
    else
        false
    fi
}

# completion menus
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# custom funcitons
isfunction copybuffer && bindkey "^o" copybuffer

# misc.
bindkey -v '^?' backward-delete-char
bindkey ' ' magic-space
bindkey '^A' autosuggest-accept
bindkey -M vicmd v edit-command-line
