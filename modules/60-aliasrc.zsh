#            _ _
#       __ _| (_) __ _ ___ _ __ ___
#      / _` | | |/ _` / __| '__/ __|
#     | (_| | | | (_| \__ \ | | (__
#    (_)__,_|_|_|\__,_|___/_|  \___|

#^ Coreutils

case "$(uname)" in
    Linux) alias \
        cp="cp -iv" \
        diff="diff --color=auto" \
        grep="grep --color=auto" \
        less='less -i' \
        ll='ls -la --color=auto' \
        ls="ls -ahN --color=auto --group-directories-first" \
        mkdir="mkdir -pv" \
        mv="mv -iv" \
        rm="rm -vI" ;;
esac

#$

#^ Git

alias \
    ga='git add' \
    gap='git add -p' \
    gau='git add -u' \
    gb='git branch' \
    gch='git checkout' \
    gcm='git commit -m' \
    gdh='git diff HEAD | less' \
    gi="git status --porcelain | grep '^??' | cut -c4- >> .gitignore" \
    gl='git ls-tree -r master --name-only | less' \
    glu='git ls-files --others --exclude-standard | less' \
    glua='git ls-files --others | less' \
    gp='git push -u origin main' \
    grh='git reset --hard' \
    grl='git rev-list --pretty=oneline --abbrev-commit HEAD | less' \
    grm='git rm -r --cached' \
    gs='git status'

#$

#^ Mutt

command -v neomutt >/dev/null \
    && alias m="cd ~/Downloads && neomutt" mutt="cd ~/Downloads && neomutt" \
    || alias m="cd ~/Downloads && mutt" mutt="cd ~/Downloads && mutt"

#$

#^ Tmux

alias \
	t="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
	tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
    ta='tmux attach-session -t' \
    td='tmux attach-session -t default' \
    tg='tmux new-session -t' \
    tk='tmux kill-session -t' \
    tl='tmux list-sessions' \
    tn='tmux new-session -d -s' \
	tt="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/default.sh && \\
        tmux attach-session -t default"

#$

#^ Vim

command -v nvim >/dev/null \
    && alias vim="nvim" v="nvim" vimdiff="nvim -d" vd="nvim -d"  \
    || alias v="vim" vimdiff="vim -d" vd="vim -d"

#$

#^ Miscellaneous

alias \
    abook="abook -C ${XDG_CONFIG_HOME:-${HOME}/.config}/abook/abookrc \\
        --datafile ${XDG_DATA_HOME:-${HOME}/.local/share}/addressbook" \
    chx='chmod +x' \
    d='dragon-drag-and-drop' \
    f='lfcd' \
    fcl='fc-list : family style | less' \
    fvm='sudo fuser -vm' \
    irssi="irssi --config=${XDG_CONFIG_HOME:-${HOME}/.config}/irssi/config \\
        --home=${XDG_CONFIG_HOME:-${HOME}/.config}/irssi" \
    k='kill' \
    ka="killall" \
    myip='dig +short myip.opendns.com @resolver1.opendns.com' \
    n='nnncd' \
    offlineimap="offlineimap -c \\
        ${XDG_CONFIG_HOME:-$HOME/.config}/offlineimap/offlineimaprc" \
    p="sudo pacman" \
    pg='pgrep' \
    pk='pkill' \
    r='rangercd' \
    z="zathura"

#$

#^ Package Management

[ -n "$NAME" ] && case $NAME in
    Arch*|Artix*)
        alias \
            install='sudo pacman -S' \
            search='pacman -Ss' \
            update='yay -Syu && pacnotifyupdate.sh' ;;
    Debian*Raspbian*)
        alias \
            install='sudo apt install' \
            search='apt search' \
            update='sudo apt update && sudo apt upgrade' ;;
esac

#$

# vim: fdm=marker fmr=#^,#$
