function preexec() {
    # Use beam shape cursor on startup and for each new prompt.
    echo -ne '\e[5 q'
}

function chpwd() {
    # Automatically ls after cd
    emulate -L zsh
    which lsd 1>/dev/null 2>&1 \
        && lsd -a \
        || ls -ahN --color=auto --group-directories-first
}

