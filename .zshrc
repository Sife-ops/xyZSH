#
# Sife's .zshrc
#

# To enable modules, create links from modules/ to init.d/ like this:
#
# $ cd ~/.config/zsh/init.d
# $ ln -sf ../modules/options.zsh ./00-options.zsh
#
# Modules are loaded in alpha-numerical order, so it is recommended to make use
# of a numbering scheme as in the above example to manage dependencies. While
# efforts are made to provide modules that are as sequence-independent as
# possible, conditions may arise in which one module is dependent on another and
# should be given a number higher than the prerequisite module. Namely, it is
# important to ensure that the keymaps module is loaded last, after the
# functions referenced in the mappings have been defined:
#
# 71-history-substring-search.zsh
# 90-keymap.zsh

for file in $(find ${ZDOTDIR}/init.d/*)
do
    source $file
done
