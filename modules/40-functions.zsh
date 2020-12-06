function copydir {
    # Copies the pathname of the current directory to the system or X Windows clipboard
    emulate -L zsh
    print -n $PWD | xclip -selection clipboard
}

function copyfile {
    # Copies the contents of a given file to the system or X Windows clipboard
    emulate -L zsh
    cat $1 | xclip -selection clipboard
}

function copybuffer () {
    # copy the active line from the command line buffer onto the system clipboard
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N copybuffer

function tmuxmenu-run {
    # run tmuxmenu.sh
    if [ -z $TMUX ]; then
        tmuxmenu.sh
    else
        tmux split-window -c "#{pane_current_path}" -f -v tmuxmenu.sh
    fi
}
zle -N tmuxmenu-run
