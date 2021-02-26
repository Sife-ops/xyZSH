#                _________  _   _
#    __  ___   _|__  / ___|| | | |
#    \ \/ / | | | / /\___ \| |_| |
#     >  <| |_| |/ /_ ___) |  _  |
#    /_/\_\\__, /____|____/|_| |_|
#          |___/

#^----- INSTRUCTIONS -----------------------------------------------------------

# To enable modules, create links from modules/ to init.d/ like this:
# $ cd ~/.config/zsh/init.d
# $ ln -sf ../modules/options.zsh ./00-options.zsh

#$

# set OS-dependent variables
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

# source plugins
for file in $(find ${ZDOTDIR}/init.d/*)
do
    source $file
done

# clean up
if [ -f /etc/os-release ]; then
    while IFS= read -r line; do
        var=$(echo "$line" | cut -d '=' -f 1)
        eval "unset $var"
    done < /etc/os-release
fi

# vim: fdm=marker fmr=#^,#$
