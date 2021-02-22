function preexec() {
    # Use beam shape cursor on startup and for each new prompt.
    echo -ne '\e[5 q'
}

function chpwd() {
    # Automatically ls after cd
    emulate -L zsh

    if which lsd 1>/dev/null 2>&1; then
        lsd -a
    else
        case "$(uname)" in
            Linux) ls -ahN --color=auto --group-directories-first ;;
            *) ls ;;
        esac
    fi
}

