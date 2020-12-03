#
# Sife's .aliasrc
#

# #--- COMMAND OPTIONS ---# #

alias \
    cp="cp -iv" \
    diff="diff --color=auto" \
    ffmpeg="ffmpeg -hide_banner" \
    grep="grep --color=auto" \
    hl="highlight --out-format=ansi" \
    less='less -i' \
    ls="ls -ahN --color=auto --group-directories-first" \
    mv="mv -iv" \
    mkdir="mkdir -pv" \
    rm="rm -vI"

# #--- ABBREVIATIONS ---# #

# General
alias \
    cal='calcurse' \
    chx='chmod +x' \
    d='dragon-drag-and-drop' \
    f='lfcd' \
    fcl='fc-list : family style | less' \
    fvm='sudo fuser -vm' \
    irssi="irssi --home=${XDG_CONFIG_HOME:-$HOME/.config}/irssi" \
    k='kill' \
    ka="killall" \
    ll='ls -la --color=auto' \
    n='nnncd' \
    nb='newsboat' \
    offlineimap="offlineimap -c \\
        ${XDG_CONFIG_HOME:-$HOME/.config}/offlineimap/offlineimaprc" \
    p="sudo pacman" \
    pg='pgrep' \
    pk='pkill' \
    r='rangercd' \
	sdn="sudo shutdown -h now" \
    so="source {${XDG_CONFIG_HOME:-${HOME}/.config}/aliasrc,${ZDOTDIR}/.zshrc}" \
    tp='trash-put' \
    xo='xdg-open' \
    xr='xrdb ~/.Xresources' \
    z="zathura"

# Git
alias \
    ga='git add' \
    gau='git add -u' \
    gch='git checkout --' \
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

# Emacs
systemctl --quiet --user is-active emacs.service >/dev/null \
    && alias e='emacsclient' \
    || alias e='emacs'

# Vim
command -v nvim >/dev/null \
    && alias vim="nvim" v="nvim" vimdiff="nvim -d"  \
    || alias v="vim"

# Tmux
alias \
	t="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
    ta='tmux attach-session -t' \
    tk='tmux kill-session -t' \
    tl='tmux list-sessions' \
	tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
