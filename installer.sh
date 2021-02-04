#!/bin/sh

#    _           _        _ _
#   (_)_ __  ___| |_ __ _| | | ___ _ __
#   | | '_ \/ __| __/ _` | | |/ _ \ '__|
#   | | | | \__ \ || (_| | | |  __/ |
#   |_|_| |_|___/\__\__,_|_|_|\___|_|

modsdir=$(pwd)/modules
initdir=$(pwd)/init.d

ln -sf "$modsdir"/00-options.zsh "$initdir"/
ln -sf "$modsdir"/10-autoload.zsh "$initdir"/
ln -sf "$modsdir"/20-zmodload.zsh "$initdir"/
ln -sf "$modsdir"/30-prompt-simple.zsh "$initdir"/
ln -sf "$modsdir"/30-zstyle.zsh "$initdir"/
ln -sf "$modsdir"/40-functions.zsh "$initdir"/
ln -sf "$modsdir"/40-special.zsh "$initdir"/
ln -sf "$modsdir"/40-widgets.zsh "$initdir"/
ln -sf "$modsdir"/50-fzf.zsh "$initdir"/
ln -sf "$modsdir"/50-lf.zsh "$initdir"/
ln -sf "$modsdir"/50-nnn.zsh "$initdir"/
ln -sf "$modsdir"/50-ranger.zsh "$initdir"/
ln -sf "$modsdir"/60-aliasrc.zsh "$initdir"/
ln -sf "$modsdir"/60-shortcuts.zsh "$initdir"/
ln -sf "$modsdir"/70-autosuggestions.zsh "$initdir"/
ln -sf "$modsdir"/70-syntax-highlighting.zsh "$initdir"/
ln -sf "$modsdir"/90-keymap.zsh "$initdir"/
