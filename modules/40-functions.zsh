function emacs () {
    # Emacs shortcut.
    emulate -L zsh
    if pgrep -x emacs ; then
        emacsclient -nw "$1"
    else
        command emacs --daemon && emacsclient -nw "$1"
    fi
}

function rsupdate () {
    # Wrapper for rsync.
    emulate -L zsh
    rsync -av --update \
        ${3:+--delete} \
        $(id -un)@$2:"$(readlink -f "$1")" \
        "$(dirname "$(readlink "$1")")/"
}

function cheat () {
    # Wrapper for cht.sh.
    emulate -L zsh
    curl cht.sh/$1
}

function copybuffer() {
    # Copy the active line from the command line buffer onto the system
    # clipboard.
    emulate -L zsh
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N copybuffer

function copydir() {
    # Copies the pathname of the current directory to the system or X Windows
    # clipboard.
    emulate -L zsh
    print -n $PWD | xclip -selection clipboard
}

function copyfile() {
    # Copies the contents of a given file to the system or X Windows clipboard.
    emulate -L zsh
    cat $1 | xclip -selection clipboard
}

function ex() {
    # Extracts archives.
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2|*.tbz2) tar xvjf "$1" ;;
            *.tar.xz) tar -xf "$1" ;;
            *.tar.gz|*.tgz) tar xvzf "$1" ;;
            *.lzma) unlzma "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x -ad "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xvf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *.xz) unxz "$1" ;;
            *.exe) cabextract "$1" ;;
            *) printf "extract: '%s' - unknown archive method\\n" "$1" ;;
        esac
    else
        printf "File \"%s\" not found.\\n" "$1"
    fi
}
