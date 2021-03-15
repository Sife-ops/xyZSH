# completion menus
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# custom funcitons
isfunction _bookmarks && bindkey "^b" _bookmarks
isfunction _copybuffer && bindkey "^o" _copybuffer

# misc.
bindkey -v '^?' backward-delete-char
bindkey ' ' magic-space
bindkey '^A' autosuggest-accept
bindkey -M vicmd v edit-command-line
