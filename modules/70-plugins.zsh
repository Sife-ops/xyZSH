zshplugins="/usr/share/zsh/plugins"
fzfplugins="/usr/share/fzf"

if [ -f /etc/os-release ]; then
    while IFS= read -r line; do
        eval "$line"
    done < /etc/os-release

    case $NAME in
        Debian*|Raspbian*) zshplugins="/usr/share"
                           fzfplugins="/usr/share/doc/fzf/examples" ;;
    esac
else
    case $(uname) in
        OpenBSD) zshplugins="/usr/local/share"
                 fzfplugins="/usr/local/share/fzf/zsh" ;;
    esac
fi
