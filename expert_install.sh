#!/bin/sh

#                            _   _
#   _____  ___ __   ___ _ __| |_| |
#  / _ \ \/ / '_ \ / _ \ '__| __| |
# |  __/>  <| |_) |  __/ |  | |_|_|
#  \___/_/\_\ .__/ \___|_|   \__(_)
#           |_|

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
