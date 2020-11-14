# Copies the pathname of the current directory to the system or X Windows clipboard
function copydir {
    emulate -L zsh
    print -n $PWD | xclip -selection clipboard
}

# Copies the contents of a given file to the system or X Windows clipboard
function copyfile {
    emulate -L zsh
    cat $1 | xclip -selection clipboard
}

# copy the active line from the command line buffer onto the system clipboard
function copybuffer () {
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N copybuffer
# bindkey "^O" copybuffer

