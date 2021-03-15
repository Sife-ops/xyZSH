# Special

function chpwd { #^
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
} #$

function preexec { #^
    # Use beam shape cursor on startup and for each new prompt.
    echo -ne '\e[5 q'
} #$

# Widgets

function _bookmarks { #^
    # Navigate to bookmark.
    emulate -L zsh

    local _conf="${ZDOTDIR}/bookmarks"

    local _color1="\033[1;33m"
    local _color2="\033[1;34m"
    local _color3="\033[1;32m"
    local _color4="\033[1;37m"

    local _marks=""
    local _letters=""

    printf "\n%bmark\tpath\n" "$_color1"
    while IFS=" " read _path _mark; do
        if [ "$_path" = "#" ] || [ -z "$_path" ]; then
            continue
        fi

        printf "%b%s\t%b%s\n" "$_color2" "$_mark" "$_color3" "$_path"
        if [ -z "$_marks" ]; then
            _marks="$_mark"
        else
            _marks="${_marks}\n${_mark}"
        fi
    done < "$_conf"

    printf "%bMark: " "$_color4"
    while true; do
        read -k 1 _letter
        printf "%s" "$_letter"

        _letters="${_letters}${_letter}"
        _matches=$(printf "%b" "$_marks" | grep "^${_letters}.*" | wc -l)

        if [ "$_matches" -eq 1 ]; then
            _path=$(grep ".* ${_letters}$" "$_conf" | cut -d " " -f 1)
            _path=$(eval "echo $_path")

            printf "\n\n"
            if [ -d "$(readlink -f $_path)" ]; then
                cd "$_path"
            else
                $EDITOR "$_path"
            fi
            break

        elif [ "$_matches" -eq 0 ]; then
            printf "\nBookmark '%s' not found." "$_letters"
            break
        fi
    done
    zle .accept-line
}
zle -N _bookmarks #$

function _copybuffer { #^
    # Copy the active line from the command line buffer onto the system
    # clipboard.
    emulate -L zsh
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N _copybuffer #$

function zle-keymap-select() { #^
    # Change cursor shape for different vi modes.
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select #$

function zle-line-init() { #^
    # Initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init #$

# Misc.

function cheat { #^
    # Wrapper for cht.sh.
    emulate -L zsh
    curl cht.sh/$1
} #$

function copydir { #^
    # Copies the pathname of the current directory to the system or X Windows
    # clipboard.
    emulate -L zsh
    print -n $PWD | xclip -selection clipboard
} #$

function copyfile { #^
    # Copies the contents of a given file to the system or X Windows clipboard.
    emulate -L zsh
    cat $1 | xclip -selection clipboard
} #$

function emacs { #^
    # Emacs shortcut.
    emulate -L zsh
    if pgrep -x emacs ; then
        [ -n "$1" ] && emacsclient -nw "$1" \
                    || emacsclient -nw
    else
        [ -n "$1" ] && command emacs --daemon && emacsclient -nw "$1" \
                    || command emacs --daemon && emacsclient -nw
    fi
} #$

function ex { #^
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
} #$

function isfunction { #^
    # test whether function is defined
    if type $1 | grep -q 'is a shell function' 2>/dev/null; then
        true
    else
        false
    fi
} #$

function pdf { #^
    # pdftotext shortcut
    text="$(mktemp /tmp/pdftotext.XXX)"
    pdftotext "$1" "$text"
    less "$text"
} #$

function rsupdate { #^
    # Wrapper for rsync.
    emulate -L zsh
    rsync -av --update \
        ${3:+--delete} \
        $(id -un)@$2:"$(readlink -f "$1")" \
        "$(dirname "$(readlink "$1")")/"
} #$

# vim: ft=sh fdm=marker fmr=#^,#$
