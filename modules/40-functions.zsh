function copydir() {
    # Copies the pathname of the current directory to the system or X Windows clipboard
    emulate -L zsh
    print -n $PWD | xclip -selection clipboard
}

function copyfile() {
    # Copies the contents of a given file to the system or X Windows clipboard
    emulate -L zsh
    cat $1 | xclip -selection clipboard
}

function copybuffer() {
    # copy the active line from the command line buffer onto the system clipboard
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N copybuffer
