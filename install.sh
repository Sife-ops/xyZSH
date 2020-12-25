#!/bin/sh

#    _           _        _ _
#   (_)_ __  ___| |_ __ _| | | ___ _ __
#   | | '_ \/ __| __/ _` | | |/ _ \ '__|
#   | | | | \__ \ || (_| | | |  __/ |
#   |_|_| |_|___/\__\__,_|_|_|\___|_|

modsdir=$(pwd)/modules
initdir=$(pwd)/init.d

[ -d $modsdir ] && [ -d $initdir ] || exit 1

for module in $(ls $modsdir); do
    while ([ ! "$answer" = "y" ] && [ ! "$answer" = "n" ]) ; do
        echo -n "install $module? y/n "
        read answer
    done
    [ "$answer" = "y" ] && ln -sf ${modsdir}/${module} ${initdir}/
    unset answer
done
