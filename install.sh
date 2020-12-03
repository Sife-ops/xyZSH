#!/bin/sh

modsdir=$(pwd)/modules
initdir=$(pwd)/fdsa

[ -d $modsdir ] && [ -d $initdir ] || exit 1

for module in $(ls $modsdir); do
    while ([ ! "$answer" = "y" ] && [ ! "$answer" = "n" ]) ; do
        echo -n "install $module? y/n "
        read answer
    done
    [ "$answer" = "y" ] && ln -sf ${modsdir}/${module} ${initdir}/
    unset answer
done
