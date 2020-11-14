# Use beam shape cursor on startup and for each new prompt.
function preexec() {
    echo -ne '\e[5 q'
}

# Automatically ls after cd
function chpwd() {
    emulate -L zsh
    which lsd 1>/dev/null 2>&1 \
        && lsd -a \
        || ls -ahN --color=auto --group-directories-first
}

