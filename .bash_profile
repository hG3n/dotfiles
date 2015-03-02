# bash_completion settings
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
        . /usr/share/bash-completion/bash_completion

if [ -f /sw/etc/bash_completion ]; then
       . /sw/etc/bash_completion
fi

# General Settings
export PS1="\[\e[1;33m\]\W hGen$ >\e[m\]\] "
export CLICOLOR=1
export LSCOLORS=FxFxCxDxBxegedabagacad # colorful List
export EDITOR=vim
export HISTCONTROL=ignoredups

HISTCONTROL=ignoredups:ignorespace

# Funtion Settins
run() { ./"$@" ;}

# Alias Source
if [ -f ~/.bash_aliases ]; then
        source ~/.bash_aliases
fi

# fink project setting
#. /sw/bin/init.sh

# C++ 4.7 Compiler PATH
export PATH=/usr/local/gcc47/bin:$PATH


